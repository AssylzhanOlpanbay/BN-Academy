import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubePlayerSection extends StatefulWidget {
  final String videoId = "KDllaPIcJcQ";
  const YoutubePlayerSection({super.key});

  @override
  State<YoutubePlayerSection> createState() => _YoutubePlayerSectionState();
}

class _YoutubePlayerSectionState extends State<YoutubePlayerSection> {
  late YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(initialVideoId: widget.videoId,
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    )
    )..addListener(onPlayerStateChange);
  }

  void onPlayerStateChange() {
    if (controller.value.playerState == PlayerState.playing);
  }  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YoutubePlayer(controller: controller)
      ],
    );
  }
}