import 'package:flutter/material.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// ignore: must_be_immutable
class EmbeddedVid extends StatefulWidget {
  EmbeddedVid({
    Key? key,
    required this.vidUrl,
    required this.desLink,
    this.autoPlay: false,
  }) : super(key: key);
  String vidUrl;
  String desLink;
  bool autoPlay;

  @override
  _EmbeddedVidState createState() => _EmbeddedVidState();
}

class _EmbeddedVidState extends State<EmbeddedVid> {

  YoutubePlayerController setController(String videoUrl) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: videoUrl,
      params: YoutubePlayerParams(
        startAt: Duration.zero,
        showControls: true,
        showFullscreenButton: true,
        autoPlay: widget.autoPlay,
      ),
    );

    return _controller;
  }

  String getId(String url){
    List<String> temp = url.split("=");
    String id = temp[1];
    return id;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    Size dimention = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          // width: dimention.width,
          // height: 200,
          
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomeColors.primaryColorPale,
          ),
          child: YoutubePlayerIFrame(
            controller: setController(getId(widget.vidUrl)),
            aspectRatio: 16 / 9,
          ),
        ),
        Container(
          child: Text(widget.desLink),
        
        )
      ],
    );
   
  }
}
