part of '../page/profile_info_page.dart';

class _ProfileInfoBody extends StatelessWidget {
  const _ProfileInfoBody({
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: WidthValues.spacingSm,
        children: [
          Gap(WidthValues.spacingSm),
          ProfileHeader(
            user: user,
          ),
          Gap(WidthValues.spacingSm),
          ProfileInfoSection(
            sectionName: context.l10n.historyLabel,
            viewsRoute: 1,
          ),
          ProfileInfoSection(
            sectionName: context.l10n.likedLabel,
            viewsRoute: 2,
          ),
          ProfileInfoSection(
            sectionName: context.l10n.bookmarksLabel,
            viewsRoute: 3,
          ),
        ],
      ),
    ));
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Gap(WidthValues.spacingLg),
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(
              'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'), //user.profilePictureUrl
        ),
        Gap(WidthValues.spacing2Md),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user.userFullName,
            ),
            Gap(WidthValues.spacingXxs),
            Text(
              user.email,
            ),
          ],
        ),
        Gap(WidthValues.spacingMd),
      ],
    );
  }
}

class ProfileInfoSection extends StatelessWidget {
  const ProfileInfoSection({super.key, required this.sectionName, required this.viewsRoute});

  final String sectionName;
  final int viewsRoute; // TODO change for a enum

  @override
  Widget build(BuildContext context) {
    /*return BlocBuilder(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final status = state.status;

          final data = state.data;

          if (status.isFailure) {
            body = Center(
              child: OnErrorWidget(
                iconSize: 30,
                icon: Icons.close_outlined,
                iconBackgroundColor: ColorValues.fgErrorPrimary(context),
                onRetry: () => context
                    .read<GetCommercesBloc>()
                    .add(const PaginatedFilteredLoaderRestarted()),
              ),
            );
          }

          if (data.isEmpty && !status.isLoading) {
            body = Center(
              child: EmptyListWidget(
                iconUrl: AssetIcons.commerceIcon,
                description: context.l10n.noNewCommercesDescriptionLabel,
                iconSize: 30,
              ),
            );
          }*/

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sectionName,
              style: ExtendedTextTheme.textMedium(context)
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            TextButton(
                onPressed: () {
                  context.pushNamed(ProfileHistoryPage.routeName, extra: viewsRoute);
                },
                child: Text('Ver todos'))
          ],
        ),
        Gap(WidthValues.spacingMd),
        //body ??
        _ViewsCarousel(views: [
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
        ], isLoading: false //status.isLoading || status.isInitial,
            ),
      ],
    );
    //}
    //);
  }
}
