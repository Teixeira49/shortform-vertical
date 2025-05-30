part of '../page/profile_history_page.dart';

class _ProfileHistoryBody extends StatelessWidget {
  const _ProfileHistoryBody();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentUserBloc, GetCurrentUserState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final user = state.user;
          final status = state.status;

          final isLoading = status.isLoading || status.isInitial;

          Widget? body;

          if (status.isFailure) {
            body = Center(
              child: OnErrorWidget(
                icon: Icons.close,
                iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                onRetry: () => context
                    .read<GetCurrentUserBloc>()
                    .add(GetCurrentUserRetryButtonPressed()),
              ),
            );
          }
          return BlocBuilder<FetchHistoryBloc, FetchHistoryState>(
              buildWhen: (previous, current) =>
                  previous.status != current.status,
              builder: (context, state) {
                final status = state.status;
                final feedVideos = state.feedVideos;

                Widget? body;

                if (status.isError) {
                  body = Center(
                    child: OnErrorWidget(
                      iconSize: 30,
                      icon: Icons.close_outlined,
                      iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                      onRetry: () => context
                          .read<FetchHistoryBloc>()
                          .add(const FetchFeedVideosEvent(userId: 1)),
                    ),
                  );
                }

                if (feedVideos.isEmpty && !status.isLoading) {
                  body = Center(
                    child: OnErrorWidget(
                      iconSize: 30,
                      icon: Icons.not_interested,
                      iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                      onRetry: () => context
                          .read<FetchHistoryBloc>()
                          .add(const FetchFeedVideosEvent(userId: 1)),
                    ),
                  );
                }
                return body ??
                    BaseLayout(
                        automaticallyImplyLeading: false,
                        child: SingleChildScrollView(
                          child: Column(
                            spacing: WidthValues.padding,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Gap(WidthValues.spacingXs),
                              Text(
                                context.l10n.searchLabel,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: TextField(
                                  //controller: _searchController,
                                  style: TextStyle(color: ColorValues.utilityGray700(context)),
                                  decoration: InputDecoration(
                                    hintText: context.l10n.searchByLabel,
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    border: InputBorder.none,
                                    prefixIcon: const Icon(Icons.search,
                                        color: Colors.grey),
                                    suffixIcon: IconButton(
                                      icon: const Icon(Icons.mic,
                                          color: Colors.grey),
                                      onPressed:
                                          () {}, // opcional: búsqueda por voz
                                    ),
                                  ),
                                  //onChanged: (value) => setState(() => _query = value),
                                ),
                              ),
                              Text(
                                context.l10n.moviesLabel,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ..._buildMoviesRows(
                                  context, feedVideos, isLoading),
                              Gap(WidthValues.padding),
                            ],
                          ),
                        ));
              });
        });
  }

  List<Widget> _buildMoviesRows(
      BuildContext context, List<Video> movies, bool isLoading) {
    final rows = <Widget>[];

    final size = MediaQuery.of(context).size;

    for (var i = 0; i < movies.length; i += 2) {
      final movies1 = movies[i];
      final movies2 = (i + 1 < movies.length) ? movies[i + 1] : null;

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          spacing: WidthValues.padding,
          children: [
//            MovieTarget(
//               url: movies1.posterUrl,
//               title: movies1.title,),
            Flexible(
                child: SizedBox(
              height: 200,
              child: MovieTarget(
                url: movies1.images.images.url,
                title: movies1.metadata.title,
                author: movies1.metadata.directors,
              ),
            )),

            if (movies2 != null)
              Flexible(
                child: SizedBox(
                  height: 200,
                  child: MovieTarget(
                    url: movies2.images.images.url,
                    title: movies2.metadata.title,
                    author: movies2.metadata.directors,
                  ),
                ),
              )
            else
              SizedBox(
                width: (size.width / 2) - WidthValues.padding * 1.5,
              ),
          ],
        ),
      );
    }

    return rows;
  }
}
