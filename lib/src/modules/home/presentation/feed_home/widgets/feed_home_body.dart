part of '../page/feed_home_page.dart';

class _HomeBody extends StatefulWidget {
  const _HomeBody();

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<_HomeBody> {
  bool _isPlaying = true;
  bool _showControls = false;

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
      _showControls = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) setState(() => _showControls = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //https://mobikul.com/tv-app-using-flutter/
    List<String> manyUrl = [
      "https://dash.akamaized.net/envivio/EnvivioDash3/manifest.mpd",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerJoyrides.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/ForBiggerMeltdowns.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/Sintel.jpg",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
      "https://storage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4"
    ];

    return BlocBuilder<UpdateFeedBloc, UpdateFeedState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          String selectPlatform(int index) {
            if (Platform.isIOS || Platform.isMacOS) {
              return state.feedVideos[index].videos.hlsUrl.url;
            } else if (Platform.isAndroid) {
              return state.feedVideos[index].videos.dashUrl.url;
            } else {
              return state.feedVideos[index].videos.hlsUrl.url;
            }
          }

          return PageView.builder(
            itemCount: manyUrl.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: _togglePlayPause,
                child: Stack(
                  children: [
                    if (state.status == UpdateFeedStatus.loaded)
                      VideoPlayerWidget(
                        videoUrl: selectPlatform(index),
                        isPlaying: _isPlaying,
                      ),
                    //else
                    //const Center(child: CircularProgressIndicator()),
                    if (_showControls)
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.center,
                          child: AnimatedOpacity(
                            opacity: _showControls ? 1.0 : 0.0,
                            duration: const Duration(milliseconds: 300),
                            child: Icon(
                              _isPlaying ? Icons.pause : Icons.play_arrow,
                              color: Colors.white,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                    Container(
                      padding: const EdgeInsets.all(
                        24,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () =>
                                context.go(AppShellBranch.values.last.path),
                            child: BlocBuilder<GetCurrentUserBloc,
                                    GetCurrentUserState>(
                                buildWhen: (previous, current) =>
                                    previous.status != current.status,
                                builder: (context, state) {
                                  final user = state.user;
                                  final status = state.status;
                                  final isLoading =
                                      status.isLoading || status.isInitial;

                                  print('status: $status');
                                  if (isLoading) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          size: 32,
                                        ),
                                        Gap(WidthValues.spacingMd),
                                        Text(
                                          user.fullName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else if (status.isFailure) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Icon(
                                          Icons.account_circle,
                                          size: 32,
                                        ),
                                        Gap(WidthValues.spacingMd),
                                        Text(
                                          AppConstants.visitorUser,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  } else {
                                    return Row(
                                      spacing: WidthValues.spacingMd,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        CircleAvatar(
                                          radius: 16,
                                          backgroundImage: user
                                                      .imageUrl.isNotEmpty &&
                                                  user.imageUrl !=
                                                      AppConstants.emptyString
                                              ? NetworkImage(user.imageUrl)
                                              : Image.asset(
                                                      AssetIcons.defaultAvatar)
                                                  .image,
                                        ),
                                        Text(
                                          user.fullName,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    );
                                  }
                                }),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.more_vert_outlined,
                              size: 32,
                            ),
                            onPressed: () {
                              showModal(context, <SliverWoltModalSheetPage>[
                                showMoreOptions(context, selectPlatform(index)),
                                showReportDetails(
                                    context,
                                    context.l10n.reportLabel,
                                    state.feedVideos[index].metadata.title),
                              ]);
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
                        ],
                      ),
                    ),
                    if (state.status == UpdateFeedStatus.loaded)
                      VideoBottomFeedVideosWidget(
                        videoMetadata: state.feedVideos[index].metadata,
                      ),
                  ],
                ),
              );
            },
          );
        });
  }

  SliverWoltModalSheetPage showMoreOptions(context, String uri) {
    return SliverWoltModalSheetPage(
      hasSabGradient: false,
      //topBarTitle: Text(
      //  'Options',
      //  style: TextStyle(color: Colors.black),
      //),
      isTopBarLayerAlwaysVisible: true,
      mainContentSliversBuilder: (BuildContext context) => [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Share'),
                leading: Icon(Icons.share_outlined),
                onTap: () async {
                  Navigator.of(context).pop();
                  await SharePlus.instance.share(ShareParams(
                    uri: Uri.parse(uri),
                    downloadFallbackEnabled: true,
                    title: 'Share this video',
                    //text: 'check out my website https://example.com'
                  ));
                },
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Safe'),
                leading: Icon(Icons.bookmark_border),
                onTap: () async {
                  CustomSnackBar.showBasicBar(
                      context, context.l10n.snackBarSaved);
                },
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Download'),
                leading: Icon(Icons.download_outlined),
                onTap: () async {
                  CustomSnackBar.showWarningBar(
                      context, context.l10n.snackBarWarningDemo);
                },
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Get Premium'),
                leading: Icon(Icons.star_border_outlined),
                onTap: () {
                  Navigator.of(context).pop();
                  context.push(PremiumPaywallPage.path);
                },
              ),
              ListTile(
                trailing: Icon(Icons.arrow_forward_ios),
                title: Text('Report this Video'),
                leading: Icon(Icons.report),
                onTap: WoltModalSheet.of(context).showNext,
              ),
            ],
          ),
        ),
      ],
    );
  }

  SliverWoltModalSheetPage showReportDetails(
      context, String title, String videoName) {
    return SliverWoltModalSheetPage(
        hasSabGradient: false,
        useSafeArea: true,
        isTopBarLayerAlwaysVisible: true,
        topBarTitle: Text(
          title,
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        mainContentSliversBuilder: (BuildContext context) => [
              SliverList(
                  delegate: SliverChildListDelegate([
                    Gap(WidthValues.padding),
                    ListTile(
                  title: Text(context.l10n.reportFeedbackLabel),
                ),
                    ListTile(
                      title: Text(context.l10n.reportVideoTitle(videoName)),
                    ),
                    Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Column(
                      spacing: WidthValues.padding,
                      children: [
                        TextField(
                          maxLines: 5,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                CustomSnackBar.showWarningBar(
                                    context, context.l10n.snackBarWarningDemo);
                                Navigator.of(context).pop();
                              },
                              child: Text(context.l10n.sendButtonLabel)),
                        )
                      ],
                    )),
              ]))
            ]);
  }
}

class VideoBottomFeedVideosWidget extends StatelessWidget {
  const VideoBottomFeedVideosWidget({super.key, required this.videoMetadata});

  final Metadata videoMetadata;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    child: InkWell(
                      onTap: () {
                        showModal(context, <SliverWoltModalSheetPage>[
                          showVideoDetails(context, videoMetadata),
                        ]);
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            videoMetadata.title,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            videoMetadata.synopsis,
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white.withOpacity(0.9),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Gap(WidthValues.spacingMd),
              ],
            ),
          ),
          Gap(WidthValues.spacingLg)
        ],
      ),
    );
  }

  SliverWoltModalSheetPage showVideoDetails(context, Metadata metadata) {
    return SliverWoltModalSheetPage(
      hasSabGradient: false,
      useSafeArea: true,
      topBarTitle: Text(
        metadata.title,
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      isTopBarLayerAlwaysVisible: true,
      mainContentSliversBuilder: (BuildContext context) => [
        SliverList(
          delegate: SliverChildListDelegate(
            [
              ListTile(
                title: Text('About this video:'),
                titleAlignment: ListTileTitleAlignment.center,
              ),
              ListTile(
                title: Text('Directors:'),
                subtitle: Text(metadata.directors),
                leading: Icon(Icons.person_2_outlined),
              ),
              ListTile(
                title: Text('Actors:'),
                subtitle: Text(metadata.actors),
                leading: Icon(Icons.people_alt_outlined),
              ),
              ListTile(
                title: Text('Synopsis:'),
                subtitle: Text(metadata.synopsis),
                leading: Icon(Icons.movie_outlined),
              ),
              ListTile(
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: WidthValues.spacingSm,
                  children: [
                    Text('Rating:'),
                    CustomTag.red(
                      context: context,
                      child: Text(metadata.rating),
                    )
                  ],
                ),
                leading: Icon(Icons.hotel_class),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

//TODO Impl later

class UserHeaderFeedVideosWidget extends StatelessWidget {
  const UserHeaderFeedVideosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCurrentUserBloc, GetCurrentUserState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          final user = state.user;
          final status = state.status;
          final isLoading = status.isLoading || status.isInitial;

          print('status: $status');
          if (isLoading) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                Gap(WidthValues.spacingMd),
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          } else if (status.isFailure) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 32,
                ),
                Gap(WidthValues.spacingMd),
                Text(
                  AppConstants.visitorUser,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          } else {
            return Row(
              spacing: WidthValues.spacingMd,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage: user.imageUrl.isNotEmpty &&
                          user.imageUrl != AppConstants.emptyString
                      ? NetworkImage(user.imageUrl)
                      : Image.asset(AssetIcons.defaultAvatar).image,
                ),
                Text(
                  user.fullName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            );
          }
        });
  }
}
