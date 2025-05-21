part of '../page/search_page.dart';

class _SearchBody extends StatefulWidget {
  const _SearchBody({super.key});

  @override
  State<_SearchBody> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<_SearchBody> {
  String _query = '';
  final _searchController = TextEditingController();

  // Simulando resultados de búsqueda
  final List<Map<String, String>> videoResults = [
    {
      "thumb": "https://dummyimage.com/80x120/222/fff&text=V1",
      "title": "The Flash"
    },
    {
      "thumb": "https://dummyimage.com/80x120/444/fff&text=V2",
      "title": "Wonder Woman"
    },
    {
      "thumb": "https://dummyimage.com/80x120/333/fff&text=V3",
      "title": "Kids Movie"
    },
    {
      "thumb": "https://dummyimage.com/80x120/555/fff&text=V4",
      "title": "Drama Show"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  controller: _searchController,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: context.l10n.searchByLabel,
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.mic, color: Colors.grey),
                      onPressed: () {}, // opcional: búsqueda por voz
                    ),
                  ),
                  onChanged: (value) => setState(() => _query = value),
                ),
              ),
              const SizedBox(height: 18),
              // Estado inicial
              if (_query.isEmpty) ...[
                Text(
                  context.l10n.browseByLabel,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.7,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _CategoryCard(
                        label: context.l10n.moviesLabel,
                        imageUrl:
                            "https://dummyimage.com/150x100/444/fff&text=${context.l10n.moviesLabel}"),
                    _CategoryCard(
                        label: context.l10n.mediaOriginalsLabel,
                        imageUrl:
                            "https://dummyimage.com/150x100/555/fff&text=Originals"),
                    _CategoryCard(
                        label: context.l10n.shortsLabel,
                        imageUrl:
                            "https://dummyimage.com/150x100/666/fff&text=${context.l10n.shortsLabel}"),
                    _CategoryCard(
                        label: context.l10n.kidsLabels,
                        imageUrl:
                            "https://dummyimage.com/150x100/777/fff&text=${context.l10n.kidsLabels}"),
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  context.l10n.genreLabel,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    _CategoryCard(
                        label: "Drama",
                        imageUrl:
                            "https://dummyimage.com/150x100/666/fff&text=Drama"),
                    _CategoryCard(
                        label: "Romance",
                        imageUrl:
                            "https://dummyimage.com/150x100/777/fff&text=Romance"),
                    // Agrega más géneros si lo deseas
                  ],
                ),
                const SizedBox(height: 18),
                Text(
                  context.l10n.forYouLabel,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: WidthValues.spacing2Md,
                  children: _buildMoviesRows([
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
                          'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'),], false),

                ),
                Gap(WidthValues.padding)
              ]
              // Estado de búsqueda
              else ...[
                Text(
                  context.l10n.resultsLabel,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 15),
                Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _buildMoviesRows([
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
                      ], false)),
              ],
            ],
          ),
        ),
      ),
    );
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

class _CategoryCard extends StatelessWidget {
  final String label;
  final String imageUrl;

  const _CategoryCard({required this.label, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(10),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
              shadows: [Shadow(blurRadius: 6, color: Colors.black)],
            ),
          ),
        ),
      ),
    );
  }
}
