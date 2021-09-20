// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:tgf_style_guide_v2/models/eventCard.dart';
// import 'package:tgf_style_guide_v2/models/imageCarousel.dart';
// import 'package:tgf_style_guide_v2/models/upcomingEvents.dart';
// import 'package:tgf_style_guide_v2/utils/colors.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:tgf_style_guide_v2/widgets/cards.dart';
// import 'package:tgf_style_guide_v2/widgets/upcomingEvents.dart';
// import 'package:tgf_style_guide_v2/widgets/videoapi.dart';
// import 'package:tgf_style_guide_v2/widgets/youTubeVid.dart';
// import 'package:http/http.dart' as http;
// import 'package:url_launcher/url_launcher.dart';

// import '../main.dart';

// // ignore: must_be_immutable
// class ImageCarousel extends StatefulWidget {
//   ImageCarousel({
//     Key? key,
//     this.autoPlay: true,
//     this.autoPlayDuration: 3,
//     this.onTap,
//   }) : super(key: key);
//   int autoPlayDuration;
//   bool autoPlay;
//   GestureTapCallback? onTap;

//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }

// class _ImageCarouselState extends State<ImageCarousel> {
//   int _current = 0;
//   List<Widget> itemListr = [];
//   var objList;

//   Future<List> getYTVids() async {
//     var url =
//         Uri.parse('https://htapp.sampurnaswasthya.com/tgf/youtube/videos');
//     var response = await http.get(url);
//     var vids = jsonDecode(response.body);
//     var vidList = [];
//     for (int i = 0; i < vids.length; i++) {
//       vidList.add(vids[i]);
//     }
//     // print(vidList[0]);
//     await getData(vidList);
//     return vidList;
//   }

//   List<ImgCar> imgCarinfo = [];

//   String urlToId(url) {
//     return url.split('/')[3];
//   }

//   getData(vidList2) {
//     objList = vidList2;
//     // print("Inside getData");
//     // print(objList);
//     for (int i = 0; i < objList.length; i++) {
//       imgCarinfo.add(
//         ImgCar(
//           imgUrl: objList[i]["contentThumbnail"],
//           vidUrl: objList[i]["contentLink"],
//           desLink: objList[i]["contentEmbeddedLink"],
//         ),
//       );
//       // print(imgCarinfo[0].desLink);
//     }
//     // print("Img car info:");
//     // print(imgCarinfo[0].vidUrl);
//     for (var i = 0; i < imgCarinfo.length; i++) {
//       ImgCar obj = imgCarinfo[i];
//       // print(obj.desLink);
//       itemListr.add(ClipRRect(
//         borderRadius: BorderRadius.all(Radius.circular(0)),
//         child: InkWell(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => VideoApi(
//                   vidId: urlToId(obj.vidUrl),
//                   vidDes: obj.desLink,
//                 ),
//               ),
//             );
//           },
//           child: Container(
//             clipBehavior: Clip.antiAlias,
//             margin:
//                 EdgeInsets.only(top: 10, left: 10, right: 10), //change 10 to 0
//             decoration: BoxDecoration(
//               color: CustomeColors.primaryColorPale,
//               borderRadius:
//                   BorderRadius.all(Radius.circular(10)), //change 10 to 0
//             ),
//             child: Image(
//               image: NetworkImage(obj.imgUrl),
//               fit: BoxFit.cover,
//               width: 1000,
//             ),
//           ),
//         ),
//       ));
//     }
//   }

//   _ImageCarouselState() {
//     getYTVids();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CarouselSlider(
//           items: itemListr,
//           options: CarouselOptions(
//               autoPlayInterval: Duration(seconds: widget.autoPlayDuration),
//               autoPlay: widget.autoPlay,
//               enableInfiniteScroll: true,
//               enlargeCenterPage: true,
//               aspectRatio: 16 / 9,
//               viewportFraction: 1,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               }),
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: itemListr.map((e) {
//             int index = itemListr.indexOf(e);
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 250),
//               width: _current == index ? 20 : 6,
//               height: 6,
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(6)),
//                 color: _current == index
//                     ? CustomeColors.primaryColor
//                     : CustomeColors.unselectedGrey,
//               ),
//             );
//           }).toList(),
//         )
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class CardCarousel extends StatefulWidget {
//   CardCarousel({
//     Key? key,
//     required this.eventCards,
//     this.autoPlay: true,
//     this.autoPlayDuration: 3,
//     this.onTap,
//   }) : super(key: key);
//   int autoPlayDuration;
//   bool autoPlay;
//   List<EventCard> eventCards;

//   GestureTapCallback? onTap;

//   @override
//   _CardCarouselState createState() => _CardCarouselState();
// }

// class _CardCarouselState extends State<CardCarousel> {
//   int _current = 0;
//   List<Widget> itemEventListr = [];
//   var objEventList;
//   List<EventCard> eventCardInfo = [];

//   Future<List> getEvents() async {
//     var url =
//         Uri.parse('https://htapp.sampurnaswasthya.com/tgf/upcoming-events');
//     var response = await http.get(url);
//     var events = jsonDecode(response.body);
//     var eventList = [];
//     for (int i = 0; i < events.length; i++) {
//       eventList.add(events[i]);
//     }
//     // print("Inside getter");
//     // print(eventList);
//     await getEventData(eventList);
//     return eventList;
//   }

//   getEventData(eventList) {
//     objEventList = eventList;
//     // print("Inside getEventData");
//     // print(objEventList);
//     for (int i = 0; i < objEventList.length; i++) {
//       eventCardInfo.add(
//         EventCard(
//           imgUrl: objEventList[i]['thumbnail'],
//           eventTitle: objEventList[i]['eventTitle'],
//           location: objEventList[i]['location'],
//           registerationLink: objEventList[i]['registerationLink'],
//           totalSeats: objEventList[i]['totalSeats'],
//           eventStartDatetime: objEventList[i]['eventStartDatetime'],
//           eventEndDatetime: objEventList[i]['eventEndDatetime'],
//         ),
//       );
//     }
//     for (var i = 0; i < eventCardInfo.length; i++) {
//       EventCard eventCard = eventCardInfo[i];
//       itemEventListr.add(
//         ClipRRect(
//           borderRadius: BorderRadius.all(Radius.circular(4)),
//           child: Container(
//             padding: EdgeInsets.only(bottom: 5, right: 5),
//             child: VerticalEventCard(
//               registerationLink: eventCard.registerationLink,
//               totalSeats: eventCard.totalSeats,
//               eventStartDatetime: eventCard.eventStartDatetime,
//               eventEndDatetime: eventCard.eventEndDatetime,
//               location: eventCard.location,
//               eventTitle: eventCard.eventTitle,
//               imgUrl: eventCard.imgUrl,
//               // startDate: eventCard.startDate,
//               // days: eventCard.days,
//               // startTime: eventCard.startTime,
//               // timePeriod: eventCard.hrs,
//               // capacity: eventCard.capacity,
//               // bookedSeats: eventCard.bookedSeats,
//               // mode: eventCard.mode,
//             ),
//           ),
//         ),
//       );
//     }
//     // print("EventCardInfo");
//     // print(eventCardInfo);
//     // print("Item Event List");
//     // print(itemEventListr);
//   }

//   _CardCarouselState() {
//     getEvents();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CarouselSlider(
//           items: itemEventListr,
//           options: CarouselOptions(
//               height: 250,
//               autoPlayInterval: Duration(seconds: widget.autoPlayDuration),
//               // autoPlay: widget.autoPlay,
//               autoPlay: false,
//               enableInfiniteScroll: false,
//               enlargeCenterPage: false,
//               viewportFraction: 0.75,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               }),
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: itemEventListr.map((e) {
//             int index = itemEventListr.indexOf(e);
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 250),
//               width: _current == index ? 20 : 6,
//               height: 6,
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(6)),
//                 color: _current == index
//                     ? CustomeColors.primaryColor
//                     : CustomeColors.unselectedGrey,
//               ),
//             );
//           }).toList(),
//         )
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class VideoCarousel extends StatefulWidget {
//   VideoCarousel({
//     Key? key,
//     required this.vidUrls,
//     required this.desLinks,
//     this.autoPlayDuration: 6,
//     this.autoPlay: true,
//   }) : super(key: key);
//   List<String> vidUrls;
//   List<String> desLinks;
//   int autoPlayDuration;
//   bool autoPlay;

//   @override
//   _VideoCarouselState createState() =>
//       _VideoCarouselState(this.vidUrls, this.desLinks);
// }

// class _VideoCarouselState extends State<VideoCarousel> {
//   int _current = 0;
//   List<Widget> itemListr = [];

//   _VideoCarouselState(List<String> vidUrls, List<String> desLinks) {
//     for (var i = 0; i < vidUrls.length; i++) {
//       itemListr.add(
//         Container(
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//           ),
//           child: ClipRRect(
//             clipBehavior: Clip.antiAlias,
//             borderRadius: BorderRadius.all(Radius.circular(10)),
//             child: EmbeddedVid(
//               vidUrl: vidUrls[i],
//               desLink: desLinks[i],
//             ),
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CarouselSlider(
//           items: itemListr,
//           options: CarouselOptions(
//               height: 225,
//               autoPlayInterval: Duration(seconds: widget.autoPlayDuration),
//               autoPlay: widget.autoPlay,
//               enableInfiniteScroll: true,
//               enlargeCenterPage: false,
//               viewportFraction: 1,
//               onPageChanged: (index, reason) {
//                 setState(() {
//                   _current = index;
//                 });
//               }),
//         ),
//         SizedBox(
//           height: 8,
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: itemListr.map((e) {
//             int index = itemListr.indexOf(e);
//             return AnimatedContainer(
//               duration: Duration(milliseconds: 250),
//               width: _current == index ? 20 : 6,
//               height: 6,
//               margin: EdgeInsets.symmetric(horizontal: 4),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.all(Radius.circular(6)),
//                 color: _current == index
//                     ? CustomeColors.primaryColor
//                     : CustomeColors.unselectedGrey,
//               ),
//             );
//           }).toList(),
//         )
//       ],
//     );
//   }
// }

// // ignore: must_be_immutable
// class NewReleasesCarousel extends StatefulWidget {
//   NewReleasesCarousel({
//     Key? key,
//     this.autoPlay: false,
//     this.autoPlayDuration: 3,
//     this.onTap,
//   }) : super(key: key);
//   bool autoPlay;
//   int autoPlayDuration;
//   GestureTapCallback? onTap;

//   @override
//   _NewReleasesCarouselState createState() => _NewReleasesCarouselState();
// }

// class _NewReleasesCarouselState extends State<NewReleasesCarousel> {
//   // List<Widget> itemListr = [];
//   // List<NextEvents> nxtEvents = [];
//   // var objRelease;
//   // ignore: unused_field
//   int _current = 0;

//   _NewReleasesCarouselState() {
//     // getobjRelease();
//   }

//   // Future<List> getobjRelease() async {
//   //   var url = Uri.parse('https://htapp.sampurnaswasthya.com/tgf/new-releases');
//   //   var response = await http.get(url);
//   //   var rcards = jsonDecode(response.body);
//   //   var cardList = [];
//   //   for (int i = 0; i < rcards.length; i++) {
//   //     cardList.add(rcards[i]);
//   //   }
//   //   // print(cardList);
//   //   await getReleaseData(cardList);
//   //   return cardList;
//   // }

//   // getReleaseData(cardList) {
//   //   objRelease = cardList;
//   //   // print("Inside GetData");
//   //   // print(objRelease);
//   //   for (int i = 0; i < objRelease.length; i++) {
//   //     nxtEvents.add(
//   //       NextEvents(
//   //         thumbnail: objRelease[i]['thumbnail'],
//   //         releaseTitle: objRelease[i]['releaseTitle'],
//   //         category: objRelease[i]['category'],
//   //         description: objRelease[i]['description'],
//   //         url: objRelease[i]['url'],
//   //       ),
//   //     );
//   //   }
//   //   for (int i = 0; i < nxtEvents.length; i++) {
//   //     NextEvents nxtEvent = nxtEvents[i];
//   //     itemListr.add(
//   //       ClipRRect(
//   //         borderRadius: BorderRadius.all(Radius.circular(0)),
//   //         child: InkWell(
//   //           onTap: () {
//   //             launch(nxtEvent.url);
//   //           },
//   //           child: Container(
//   //             clipBehavior: Clip.antiAlias,
//   //             margin: EdgeInsets.only(
//   //                 top: 10, left: 10, right: 10), //change 10 to 0
//   //             decoration: BoxDecoration(
//   //               color: CustomeColors.primaryColorPale,
//   //               borderRadius: BorderRadius.all(
//   //                 Radius.circular(10),
//   //               ), //change 10 to 0
//   //             ),
//   //             child: UpcomingEventCard(
//   //               releaseTitle: nxtEvent.releaseTitle,
//   //               thumbnail: nxtEvent.thumbnail,
//   //               category: nxtEvent.category,
//   //               description: nxtEvent.description,
//   //             ),
//   //           ),
//   //         ),
//   //       ),
//   //     );
//   //   }
//   //   print("final list");
//   //   print(itemListr);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         CarouselSlider(
//           items: itemListr,
//           options: CarouselOptions(
//             scrollDirection: Axis.vertical,
//             autoPlayInterval: Duration(seconds: widget.autoPlayDuration),
//             autoPlay: widget.autoPlay,
//             // enableInfiniteScroll: true,
//             enableInfiniteScroll: false,
//             enlargeCenterPage: false,
//             // enlargeCenterPage: true,
//             aspectRatio: 16 / 9,
//             viewportFraction: 0.75,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _current = index;
//               });
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
