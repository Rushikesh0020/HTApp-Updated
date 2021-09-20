// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:tgf_style_guide_v2/models/bookCard.dart';
// import 'package:tgf_style_guide_v2/models/eventCard.dart';
// import 'package:tgf_style_guide_v2/models/horizontalCards.dart';
// import 'package:tgf_style_guide_v2/utils/variableSet.dart';
// import 'package:tgf_style_guide_v2/widgets/cards.dart';
// import 'package:tgf_style_guide_v2/widgets/carousel.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:tgf_style_guide_v2/widgets/demoSamayFetch.dart';
// import 'package:tgf_style_guide_v2/widgets/horizontalCard.dart';
// import 'package:tgf_style_guide_v2/widgets/timerCard.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';
// import 'package:http/http.dart';

// var samayTimings;


// class DummyPage extends StatefulWidget {
//   DummyPage({Key? key}) : super(key: key);

//   @override
//   _DummyPageState createState() => _DummyPageState();
// }

// YoutubePlayerController _controller = YoutubePlayerController(
//   initialVideoId: 'K18cpp_-gP8',
//   params: YoutubePlayerParams(
//     playlist: ['uUvOaEBfSLw', 'oW07gWEDSNc'], // Defining custom playlist
//     // startAt: Duration(seconds: 30),
//     showControls: true,
//     showFullscreenButton: true,
    
//   ),
// );

// class _DummyPageState extends State<DummyPage> {

//   @override
//   void initState() {
//     super.initState();
//     getTimings();
//   }

//   void getTimings() async {
    
//     samayTimings = await getsamay();
//     print('Main Samay List: ');
//     print(samayTimings);
    
//   }

//   List<EventCard> events = ListSet.eventCardInfo;
//   List<BookCardIn> books = ListSet.bookCardInfo;
//   List<HorizontalCards> newReleases = ListSet.hCardInfo;
//   @override
//   Widget build(BuildContext context) {
//     Size dimention = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//           iconTheme: IconThemeData(color: Colors.black),
//           backgroundColor: Colors.white,
//           elevation: 2,
//           leading: Builder(builder: (context) {
//             return IconButton(
//               onPressed: () => Scaffold.of(context).openDrawer(),
//               icon: Icon(
//                 Icons.menu_outlined,
//                 size: 30,
//               ),
//             );
//           }),
//           actions: [
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 CupertinoIcons.search,
//                 size: 30,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 Icons.favorite_border_outlined,
//                 size: 30,
//               ),
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(
//                 CupertinoIcons.bell,
//                 size: 30,
//               ),
//             ),
//           ]),
//       drawer: Drawer(),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 5,
//             ),
//             // ImageCarousel(
//             //   itemList: UrlSet.eventUrl,
//             // ),
//             YoutubePlayerIFrame(
//               controller: _controller,
//               aspectRatio: 16 / 9,
//             ),

//             SizedBox(
//               height: 30,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 22),
//               child: Text(
//                 "UPCOMING EVENTS".toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: GoogleFonts.poppins().fontFamily,
//                   fontSize: 16,
//                   letterSpacing: 0.5,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xff4A417F),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             CardCarousel(
//               eventCards: ListSet.eventCardInfo,
//               autoPlay: false,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 22),
//               child: Text(
//                 "REMINDER".toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: GoogleFonts.poppins().fontFamily,
//                   fontSize: 16,
//                   letterSpacing: 0.5,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xff4A417F),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
// //                  SizedBox(
// //                    width: 17,
// //                  ),
//                 SamaySampana(),
//                 //  SizedBox(
//                 //    width: 16,
//                 //  ),
//                 //  Timer(),
//                 SizedBox(
//                   width: 16,
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               padding: EdgeInsets.only(left: 22),
//               child: Text(
//                 "New Releases".toUpperCase(),
//                 style: TextStyle(
//                   fontFamily: GoogleFonts.poppins().fontFamily,
//                   fontSize: 16,
//                   letterSpacing: 0.5,
//                   fontWeight: FontWeight.w600,
//                   color: Color(0xff4A417F),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Container(
//               height: dimention.height,
//               child: ListView.separated(
//                   itemBuilder: (context, index) {
//                     HorizontalCards newRelease = newReleases[index];
//                     return Container(
//                       child: UpcomingEventsCard(
//                         bookTitle: newRelease.title,
//                         itemType: newRelease.itemType,
//                         mins: newRelease.mins,
//                       ),
//                     );
//                   },
//                   separatorBuilder: (context, index) => SizedBox(
//                         height: 15,
//                       ),
//                   itemCount: newReleases.length),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
