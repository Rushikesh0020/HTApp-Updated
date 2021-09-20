import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgf_style_guide_v2/utils/colors.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class UpcomingEventCard extends StatefulWidget {
  UpcomingEventCard({
    Key? key,
    required this.releaseTitle,
    required this.thumbnail,
    required this.category,
    required this.description,
  }) : super(key: key);
  String releaseTitle, category, thumbnail, description;

  @override
  _UpcomingEventCardState createState() => _UpcomingEventCardState();
}

class _UpcomingEventCardState extends State<UpcomingEventCard> {
  @override
  Widget build(BuildContext context) {
    Size dimention = MediaQuery.of(context).size;
    return Material(
      color: Colors.white,
      elevation: 2.5,
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.all(Radius.circular(4)),
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: dimention.width,
        // height: 112,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              width: 144,
              // height: 112,
              decoration: BoxDecoration(
                color: CustomeColors.primaryColorPale,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: Image(
                image: NetworkImage(widget.thumbnail),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.category,
                    style: TextStyle(
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: CustomeColors.secondaryColor,
                    ),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Container(
                    width: dimention.width * 0.55,
                    child: Text(
                      widget.releaseTitle,
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: CustomeColors.neutralColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    width: 175,
                    child: Text(
                      widget.description,
                      style: TextStyle(
                        fontFamily: GoogleFonts.roboto().fontFamily,
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                        color: CustomeColors.neutralColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 19,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

// _launchURL(String bookUrl) async {
//   // const url = 'https://flutter.io';
//   String url = bookUrl;
//   // if (await canLaunch(url)) {
//   await launch(url);
//   // }
//   // else {
//   //   throw 'Could not launch $url';
//   // }
// }
