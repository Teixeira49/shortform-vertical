part of '../page/feed_home_page.dart';

class _HomeBody extends StatelessWidget {
  const _HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return
        /*RefreshIndicator.adaptive(
        onRefresh: () async {
          print('recarga');
        },
        child: ListView(
          children: [*/
        _VideoScreen();
    //],
    //    )
    //);
  }
}

class _VideoScreen extends StatelessWidget {
  const _VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //return BlocBuilder<UpdateFeedBloc, PaginatedFilteredLoaderState<Commerce>>(
    //  builder: (context, state) {

    final size = MediaQuery.of(context).size;

    return Center(
      child: PageView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              VideoPlayerWidget(),
              Positioned(
                  top: 25,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.account_circle),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      PopupMenuButton(
                          itemBuilder: (BuildContext context) => [
                                PopupMenuItem(
                                  child: Text(
                                    'Option 1',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: Text(
                                    'Option 2',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ])
                    ],
                  )),
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Container(
                              padding: const EdgeInsets.only(
                                left: 24,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'User Name',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    'Description',
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                        const SizedBox(height: 8),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height / 2.5,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      bottom: 24,
                    ),
                    margin: EdgeInsets.only(top: size.height / 5),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () {
                            // Handle favorite button press
                          },
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.comment),
                          onPressed: () {
                            // Handle comment button press
                          },
                        ),
                        const SizedBox(width: 8),
                        IconButton(
                          icon: const Icon(Icons.share),
                          onPressed: () async {
                            await SharePlus.instance.share(ShareParams(
                                uri: Uri.parse(
                                    'https://i.pinimg.com/736x/20/b3/33/20b333af293a687925a2652345015f4e.jpg'),
                                downloadFallbackEnabled: true,
                                title: 'Share this video',
                                //text: 'check out my website https://example.com'
                            ));
                          },
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          );
        },
        //  },
      ),
    );
  }
}
