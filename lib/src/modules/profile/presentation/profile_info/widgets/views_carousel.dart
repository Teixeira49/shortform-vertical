part of '../page/profile_info_page.dart';

class _ViewsCarousel extends StatefulWidget {
  const _ViewsCarousel({
    required this.views,
    required this.isLoading,
  });

  final List<Movie> views;
  final bool isLoading;

  @override
  _ViewsCarouselState createState() => _ViewsCarouselState();
}

class _ViewsCarouselState extends State<_ViewsCarousel> {
  late PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: _currentPage,
      viewportFraction: 0.30,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final views = widget.views;
    final isLoading = widget.isLoading;

    return Column(children: [
      SizedBox(
          height: 200,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            controller: _pageController,
            itemCount: views.length,
            padEnds: false,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(right: 10),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: isLoading
                      ? Skeleton.shade(
                          child: Container(),
                        )
                      : MovieTarget(
                          url: views[index].posterUrl,
                          title: views[index].title,
                  )
                ),
              );
            },
          ))
    ]);
  }
}
