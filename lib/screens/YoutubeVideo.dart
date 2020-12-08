import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ext_video_player/ext_video_player.dart';

class YoutubeVideo extends StatefulWidget {
  @override
  _YoutubeVideoState createState() => _YoutubeVideoState();
}

class _YoutubeVideoState extends State<YoutubeVideo> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
      'https://www.youtube.com/watch?v=Uyk2Nff-hoc&ab_channel=SparkInteract-SydneyWebDesign%26Development',
    );
    _controller.play();
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1200,
      height: 250,
      child: Stack(alignment: Alignment.bottomCenter, children: [
        VideoPlayer(_controller),
        ClosedCaption(text: _controller.value.caption.text),
        _PlayPauseOverlay(controller: _controller),
        VideoProgressIndicator(
          _controller,
          allowScrubbing: true,
        ),
      ]),
    );
  }
}

class _PlayPauseOverlay extends StatelessWidget {
  const _PlayPauseOverlay({Key key, this.controller}) : super(key: key);

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: Duration(milliseconds: 50),
          reverseDuration: Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
      ],
    );
  }
}
