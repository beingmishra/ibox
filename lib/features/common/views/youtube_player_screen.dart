import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ibox/config/theme/app_colors.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerScreen extends StatefulWidget {
  final String videoId;
  const YoutubePlayerScreen({super.key, required this.videoId});

  @override
  State<YoutubePlayerScreen> createState() => _YoutubePlayerScreenState();
}

class _YoutubePlayerScreenState extends State<YoutubePlayerScreen> {

  late YoutubePlayerController _controller;
  bool isFullScreen = false;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: isFullScreen ? null : AppBar(),
      extendBodyBehindAppBar: true,
      body: Center(
        child: YoutubePlayerBuilder(
          onEnterFullScreen: () {
            setState(() {
              isFullScreen = true;
            });
          },
          onExitFullScreen: () {
            setState(() {
              isFullScreen = false;
            });
          },
          player: YoutubePlayer(
            bufferIndicator: const CupertinoActivityIndicator(),
            progressColors: const ProgressBarColors(
              handleColor: AppColors.primaryColor,
              playedColor: AppColors.primaryColor,
            ),
            controller: _controller,
          ),
          builder: (context, player) {
            return player;
          },
        ),
      ),
    );
  }
}
