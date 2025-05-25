part of '../page/profile_history_page.dart';

class _ProfileHistoryBody extends StatelessWidget {
  const _ProfileHistoryBody();

  @override
  Widget build(BuildContext context) {
    List<Movie> tempList = [
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
      Movie(
          assetsName: 'ejemplo',
          title: 'title',
          actors: 'actors',
          directors: 'directors',
          rating: 'rating',
          synopsis: 'synopsis',
          availDate: 'availDate',
          expDate: 'expDate',
          posterUrl:
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),
    ];

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
          return BaseLayout(
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
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: context.l10n.searchByLabel,
                          hintStyle: const TextStyle(color: Colors.grey),
                          border: InputBorder.none,
                          prefixIcon:
                              const Icon(Icons.search, color: Colors.grey),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.mic, color: Colors.grey),
                            onPressed: () {}, // opcional: búsqueda por voz
                          ),
                        ),
                        //onChanged: (value) => setState(() => _query = value),
                      ),
                    ),
                    Gap(WidthValues.spacingXs),
                    Text(
                      context.l10n.moviesLabel,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Gap(WidthValues.spacing2Md),
                    ..._buildMoviesRows(tempList, isLoading),
                    Gap(WidthValues.padding),
                  ],
                ),
              ));
        });
  }

  List<Widget> _buildMoviesRows(List<Movie> movies, bool isLoading) {
    final rows = <Widget>[];

    for (var i = 0; i < movies.length; i += 2) {
      final movies1 = movies[i];
      final movies2 = (i + 1 < movies.length) ? movies[i + 1] : null;

      rows.add(
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
//            MovieTarget(
//               url: movies1.posterUrl,
//               title: movies1.title,),
            SizedBox(
              height: 200,
              child: MovieTarget(
                url: movies1.posterUrl,
                title: movies1.title,
              ),
            ),

            if (movies2 != null)
              SizedBox(
                height: 200,
                child: MovieTarget(
                  url: movies2.posterUrl,
                  title: movies2.title,
                ),
              ),
          ],
        ),
      );
    }

    return rows;
  }
}
