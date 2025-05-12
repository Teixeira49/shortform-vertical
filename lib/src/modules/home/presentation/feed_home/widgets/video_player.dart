part of '../page/feed_home_page.dart';

class VideoPlayerWidget extends StatefulWidget {
  const VideoPlayerWidget({super.key});

  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayerWidget> {

  // late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    // _controller = VideoPlayerController.network(
    //   'https://www.example.com/video.mp4',
    // )
    //   ..initialize().then((_) {
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    // _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Image.network(
            'https://i.pinimg.com/736x/20/b3/33/20b333af293a687925a2652345015f4e.jpg'));
  }
}
