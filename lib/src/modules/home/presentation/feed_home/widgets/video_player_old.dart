
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget(
      {required this.videoUrl, required this.isPlaying, super.key});

  final String videoUrl;
  final bool isPlaying;

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      widget.videoUrl,
    )..initialize().then((value) {
      _controller.play();
      _controller.setVolume(1);
      _controller.setLooping(true);
    });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant VideoPlayerWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Sincroniza el estado de reproducción cuando cambia la prop
    if (widget.isPlaying != oldWidget.isPlaying) {
      widget.isPlaying ? _controller.play() : _controller.pause();
    }
  }

  @override
  Widget build(BuildContext context) {
    return !_controller.value.isInitialized
        ? const Center(
      child: CircularProgressIndicator(
        color: Colors.green,
        strokeWidth: 2,
      ),
    )
        : VideoPlayer(_controller);

    /*if (!_controller.value.isInitialized) {

    }
    return
          Container(
              width: size.width,
              height: size.height,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: VideoPlayer(_controller),
          //'https://i.pinimg.com/736x/20/b3/33/20b333af293a687925a2652345015f4e.jpg'
    );*/
  }
}
