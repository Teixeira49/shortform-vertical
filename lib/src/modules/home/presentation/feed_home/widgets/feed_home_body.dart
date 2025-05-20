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
              Container(
                padding: const EdgeInsets.all(
                  24,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: size.height / 2,
                              color: Colors.white,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: const Icon(Icons.share),
                                    title: const Text('Share'),
                                    onTap: () {
                                      // Handle share action
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.save),
                                    title: const Text('Save'),
                                    onTap: () {
                                      // Handle save action
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    leading: const Icon(Icons.report),
                                    title: const Text('Report'),
                                    onTap: () {
                                      // Handle report action
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.account_circle,
                            size: 32,
                          ),
                          Gap(WidthValues.spacingMd),
                          Text(
                            'User Name',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert_outlined,
                        size: 32,
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: size.height / 2,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.share),
                                      title: const Text('Share'),
                                      onTap: () {
                                        // Handle share action
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.save),
                                      title: const Text('Save'),
                                      onTap: () {
                                        // Handle save action
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.report),
                                      title: const Text('Report'),
                                      onTap: () {
                                        // Handle report action
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(top: size.height / 5),
                padding: const EdgeInsets.only(
                  right: 24,
                  bottom: 24,
                ),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        TapFillIcon(
                          onTap: () {
                            print("cambia cantidad de likes backend");
                          },
                          fillIcon: Icon(
                            Icons.favorite,
                            size: 32,
                          ),
                          borderIcon: Icon(
                            Icons.favorite_border,
                            size: 32,
                          ),
                        ),
                        Text(
                          '100k',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Gap(WidthValues.spacingLg)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.comment,
                            size: 32,
                          ),
                          onPressed: () {
                            showModal(context, <SliverWoltModalSheetPage>[
                              showComments(context),
                            ]);
                          },
                        ),
                        Text(
                          '100k',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Gap(WidthValues.spacingLg)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.share,
                            size: 32,
                          ),
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
                        Text(
                          'Share',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Gap(WidthValues.spacingLg)
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.bookmark_border,
                            size: 32,
                          ),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: size.height / 2,
                                  color: Colors.white,
                                  child: Column(
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.share),
                                        title: const Text('Share'),
                                        onTap: () {
                                          // Handle share action
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.save),
                                        title: const Text('Save'),
                                        onTap: () {
                                          // Handle save action
                                          Navigator.pop(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.report),
                                        title: const Text('Report'),
                                        onTap: () {
                                          // Handle report action
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        Text(
                          'Safe',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        Gap(WidthValues.spacingLg)
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(
                  right: 24,
                  bottom: 24,
                ),
                alignment: Alignment.bottomRight,
                child: Column(
                  children: [
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
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                          Gap(WidthValues.spacingMd),
                        ],
                      ),
                    ),
                    Gap(WidthValues.spacingLg)
                  ],
                ),
              )
            ],
          );
        },
        //  },
      ),
    );
  }

  SliverWoltModalSheetPage showComments(context) {
    return SliverWoltModalSheetPage(
      hasSabGradient: false,
      topBarTitle: Text('Comments', style: TextStyle(color: Colors.red),),
      isTopBarLayerAlwaysVisible: true,
      trailingNavBarWidget: IconButton(
        padding: const EdgeInsets.all(16),
        icon: const Icon(Icons.close),
        onPressed: Navigator.of(context).pop,
      ),
      stickyActionBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: TextField(
          keyboardType: TextInputType.multiline,
          minLines: 1,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: 'Add a comment...',
            border: OutlineInputBorder(),
            suffixIcon: IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                // Handle send action
              },
            ),
          ),
        ),
      ),
      mainContentSliversBuilder: (BuildContext context) => [
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return ListTile(
                title: Text('User $index'),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://yt3.ggpht.com/yti/ANjgQV8D_mFWkZ6j3O5Sp_c48DVnNJEb2HHs5M3Vh6s5uIErEjQ=s108-c-k-c0x00ffffff-no-rj'), //user.profilePictureUrl
                ),
                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TapFillIcon(
                      onTap: () {
                        print("cambia cantidad de likes backend");
                      },
                      fillIcon: Icon(
                        Icons.favorite,
                        size: 20,
                      ),
                      borderIcon: Icon(
                        Icons.favorite_border,
                        size: 20,
                      ),
                    ),
                    Gap(WidthValues.spacingXs),
                    Text(
                      '100k',
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                subtitle: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(WidthValues.spacingXs),
                    Text('Comment $index', textAlign: TextAlign.justify,),
                    Row(
                      children: [
                        TextButton(onPressed: () {
                          print('responde');
                        }, child: Text('Responder')),
                        TextButton(onPressed: () {
                          print('responde');
                        }, child: Text('Reportar'))
                      ],
                    )
                  ],
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    );
  }
}
