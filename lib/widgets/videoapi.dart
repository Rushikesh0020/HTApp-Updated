import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

// ignore: must_be_immutable
class VideoApi extends StatefulWidget {
  VideoApi({
    Key? key,
    this.vidId: "9mD2-8kzfyw",
    this.vidDes: "ht",
  }) : super(key: key);
  String vidId;
  String vidDes;

  @override
  _VideoApiState createState() => _VideoApiState(this.vidId, this.vidDes);
}

class _VideoApiState extends State<VideoApi> {
  String vidID = "";
  String vidDesc = "";
  late YoutubePlayerController _controller;

  _VideoApiState(String vidId, String vidDes) {
    vidID = vidId;
    vidDesc = vidDes;
    _controller = YoutubePlayerController(
      initialVideoId: vidID,
      params: YoutubePlayerParams(
        showControls: true,
        showFullscreenButton: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 2,
          leading: Builder(builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu_outlined,
                size: 30,
              ),
            );
          }),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.search,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                CupertinoIcons.bell,
                size: 30,
              ),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                // color: CustomeColors.primaryColorPale,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: YoutubePlayerIFrame(
                controller: _controller,
                aspectRatio: 16 / 9,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(vidDesc),
            )
          ],
        ),
      ),
    );
  }
}

//  String getYoutubeVideoId(String Url) {
//   RegExp regExp = new RegExp(
//     r'.*(?:(?:youtu\.be\/|v\/|vi\/|u\/\w\/|embed\/)|(?:(?:watch)?\?v(?:i)?=|\&v(?:i)?=))([^#\&\?]*).*',
//     caseSensitive: false,
//     multiLine: false,
//   );
// String url = "";
// final match = regExp.firstMatch(url)!.group(1); // <- This is the fix
// String str = match!;
// return str;
// }
