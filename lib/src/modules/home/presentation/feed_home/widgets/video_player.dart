part of '../page/feed_home_page.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {required this.videoUrl,
      required this.subtitleUrl,
      required this.isPlaying,
      super.key});

  final String videoUrl;
  final String subtitleUrl;
  final bool isPlaying;

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late BetterPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _setupPlayer();
  }

  void _setupPlayer() {
    final dataSource = BetterPlayerDataSource(
      widget.videoUrl.endsWith('.mpd')
          ? BetterPlayerDataSourceType.network
          : BetterPlayerDataSourceType.network,
      widget.videoUrl,
      useAsmsSubtitles: true,
      //useAsmsTracks: true,
      liveStream: false,
      videoFormat: widget.videoUrl.endsWith('.mpd')
          ? BetterPlayerVideoFormat.dash
          : widget.videoUrl.endsWith('.m3u8')
              ? BetterPlayerVideoFormat.hls
              : BetterPlayerVideoFormat.other,
      subtitles: BetterPlayerSubtitlesSource.single(
          type: BetterPlayerSubtitlesSourceType.network,
          selectedByDefault: true,
          name: "EN",
          url: widget.subtitleUrl),
    );

    _controller = BetterPlayerController(
      BetterPlayerConfiguration(
        autoPlay: widget.isPlaying,
        looping: true,
        aspectRatio: 9 / 16,
        fit: BoxFit.contain,
        subtitlesConfiguration: const BetterPlayerSubtitlesConfiguration(
          fontSize: 18,
          fontFamily: "Roboto",
          fontColor: Colors.white,
        ),
      ),
      betterPlayerDataSource: dataSource,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.videoUrl != oldWidget.videoUrl) {
      _controller.dispose();
      _setupPlayer();
    } else if (widget.isPlaying != oldWidget.isPlaying) {
      widget.isPlaying ? _controller.play() : _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BetterPlayer(controller: _controller);
  }
}
