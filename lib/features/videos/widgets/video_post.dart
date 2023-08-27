import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/widgets/video_button.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoPost extends StatefulWidget {
  final Function onVideoFinished;

  final int index;

  const VideoPost(
      {super.key, required this.onVideoFinished, required this.index});

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  VideoPlayerController _videoPlayerController =
      VideoPlayerController.asset("assets/videos/video.mp4");

  bool _isPaused = false;

  final Duration _animationDuration = const Duration(milliseconds: 200);

  late final AnimationController _animationController;

  void _onVideoChange() {
    if (_videoPlayerController.value.isInitialized) {
      if (_videoPlayerController.value.duration ==
          _videoPlayerController.value.position) {
        widget.onVideoFinished();
      }
    }
  }

  void _initVideoPlayer() async {
    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/video.mp4');
    await _videoPlayerController.initialize();
    // _videoPlayerController.play();
    await _videoPlayerController.setLooping(true);
    setState(() {});
    _videoPlayerController.addListener((_onVideoChange));
  }

  @override
  void initState() {
    super.initState();
    _initVideoPlayer();

    _animationController = AnimationController(
      vsync: this,
      lowerBound: 1.0,
      upperBound: 1.5,
      value: 1.5,
      duration: _animationDuration,
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  void _onVisibilityChanged(VisibilityInfo info) {
    if (info.visibleFraction == 1 && !_videoPlayerController.value.isPlaying) {
      _videoPlayerController.play();
    }
  }

  void _onTogglePause() {
    if (_videoPlayerController.value.isPlaying) {
      _videoPlayerController.pause();
      _animationController.reverse();
    } else {
      _videoPlayerController.play();
      _animationController.forward();
    }

    setState(() {
      _isPaused = !_isPaused;
    });
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key("${widget.index}"),
      onVisibilityChanged: _onVisibilityChanged,
      child: Stack(
        children: [
          Positioned.fill(
              child: _videoPlayerController.value.isInitialized
                  ? VideoPlayer(_videoPlayerController)
                  : Container(color: Colors.black)),
          Positioned.fill(child: GestureDetector(onTap: _onTogglePause)),
          Positioned.fill(
              child: IgnorePointer(
            child: Center(
                child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.scale(
                    scale: _animationController.value, child: child);
              },
              child: AnimatedOpacity(
                opacity: _isPaused ? 1 : 0,
                duration: _animationDuration,
                child: const FaIcon(FontAwesomeIcons.play,
                    color: Colors.white, size: Sizes.size52),
              ),
            )),
          )),
          Positioned(
            bottom: 20,
            left: 10,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("@니꼬",
                      style: TextStyle(
                          fontSize: Sizes.size20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  Gaps.v10,
                  Text("This is my house in Thailand!!!",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        color: Colors.white,
                      ))
                ]),
          ),
          Positioned(
              bottom: 20,
              right: 10,
              child: Column(
                children: const [
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    foregroundImage: NetworkImage(
                        "https://avatars.githubusercontent.com/u/3612017"),
                    child: Text("니꼬"),
                  ),
                  Gaps.v24,
                  VideoButton(icon: FontAwesomeIcons.solidHeart, text: "2.9M"),
                  Gaps.v24,
                  VideoButton(icon: FontAwesomeIcons.solidComment, text: "33K"),
                  Gaps.v24,
                  VideoButton(icon: FontAwesomeIcons.share, text: "Share")
                ],
              ))
        ],
      ),
    );
  }
}
