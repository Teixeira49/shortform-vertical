part of '../page/profile_history_page.dart';

class _ProfileHistoryBody extends StatelessWidget {
  const _ProfileHistoryBody({
    required this.user,
  });

  final User user;

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

    return BaseLayout(
        automaticallyImplyLeading: false,
        child: SingleChildScrollView(
          child: Column(
            spacing: WidthValues.padding,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gap(WidthValues.padding),
              ..._buildRewardRows(tempList, false),
              Gap(WidthValues.padding),
            ],
          ),
        ));
  }

  List<Widget> _buildRewardRows(List<Movie> movies, bool isLoading) {
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
              child:  MovieTarget(
                  url: movies1.posterUrl,
                  title: movies1.title,
                ),
              ),

            if (movies2 != null)
              SizedBox(
                height: 200,
                child:  MovieTarget(
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
