import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tgf_style_guide_v2/pages/event_page.dart';
import 'package:tgf_style_guide_v2/pages/follow_us.dart';
import 'package:tgf_style_guide_v2/pages/loginPage.dart';
import 'package:tgf_style_guide_v2/widgets/cards.dart';
import 'package:url_launcher/url_launcher.dart';
import 'models/eventCard.dart';
import 'models/upcomingEvents.dart';
import 'utils/colors.dart';
import 'widgets/carousel.dart';
import 'package:http/http.dart' as http;

import 'widgets/upcomingEvents.dart';

// ignore: unused_import

// import 'package:tgf_style_guide_v2/widgets/theme.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(PackageApp());
}
 
var objRelease;
var cardList;

//Upcoming Events: Card Caraousel
 var objEventList;
List<Widget> itemEventListr = [];
List<EventCard> eventCardInfo = [];
List<Widget> itemListr = [];
List<NextEvents> nxtEvents = [];

bool followUsTitle = false;


class PackageApp extends StatefulWidget {
  const PackageApp({Key? key}) : super(key: key);
  @override
  _PackageAppState createState() => _PackageAppState();
  
  static final baseUrl = 'https://htapp.sampurnaswasthya.com/';
  
}

class _PackageAppState extends State<PackageApp> {
  int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    getobjRelease();
    getEvents();
  }



  Future<List> getEvents() async {
    var url =
        Uri.parse('https://htapp.sampurnaswasthya.com/tgf/upcoming-events');
    var response = await http.get(url);
    var events = jsonDecode(response.body);
    var eventList = [];
    for (int i = 0; i < events.length; i++) {
      eventList.add(events[i]);
    }
    // print("Inside getter");
    // print(eventList);
    await getEventData(eventList);
    return eventList;
  }

  getEventData(eventList) {
    objEventList = eventList;
    // print("Inside getEventData");
    // print(objEventList);

    //Model List
    for (int i = 0; i < objEventList.length; i++) {
      eventCardInfo.add(
        EventCard(
          imgUrl: objEventList[i]['thumbnail'],
          eventTitle: objEventList[i]['eventTitle'],
          location: objEventList[i]['location'],
          registerationLink: objEventList[i]['registerationLink'],
          totalSeats: objEventList[i]['totalSeats'],
          eventStartDatetime: objEventList[i]['eventStartDatetime'],
          eventEndDatetime: objEventList[i]['eventEndDatetime'],
        ),
      );
    }
    //Adding to the carousel
    for (var i = 0; i < eventCardInfo.length; i++) {
      EventCard eventCard = eventCardInfo[i];
      itemEventListr.add(
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Container(
            padding: EdgeInsets.only(bottom: 5, right: 5),
            child: VerticalEventCard(
              registerationLink: eventCard.registerationLink,
              totalSeats: eventCard.totalSeats,
              eventStartDatetime: eventCard.eventStartDatetime,
              eventEndDatetime: eventCard.eventEndDatetime,
              location: eventCard.location,
              eventTitle: eventCard.eventTitle,
              imgUrl: eventCard.imgUrl,
              // startDate: eventCard.startDate,
              // days: eventCard.days,
              // startTime: eventCard.startTime,
              // timePeriod: eventCard.hrs,
              // capacity: eventCard.capacity,
              // bookedSeats: eventCard.bookedSeats,
              // mode: eventCard.mode,
            ),
          ),
        ),
      );
    }
  }

   Future<List> getobjRelease() async {
    var url = Uri.parse('https://htapp.sampurnaswasthya.com/tgf/new-releases');
    var response = await http.get(url);
    var rcards = jsonDecode(response.body);
    cardList = [];
    for (int i = 0; i < rcards.length; i++) {
      cardList.add(rcards[i]);
    }
    // print(cardList);
    await getReleaseData(cardList);
    return cardList;
  }

   getReleaseData(cardList) {
    objRelease = cardList;
    // print("Inside GetData");
    // print(objRelease);
    for (int i = 0; i < objRelease.length; i++) {
      nxtEvents.add(
        NextEvents(
          thumbnail: objRelease[i]['thumbnail'],
          releaseTitle: objRelease[i]['releaseTitle'],
          category: objRelease[i]['category'],
          description: objRelease[i]['description'],
          url: objRelease[i]['url'],
        ),
      );
    }
    for (int i = 0; i < nxtEvents.length; i++) {
      NextEvents nxtEvent = nxtEvents[i];
      itemListr.add(
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(0)),
          child: InkWell(
            onTap: () {
              launch(nxtEvent.url);
            },
            child: Container(
              clipBehavior: Clip.antiAlias,
              margin: EdgeInsets.only(
                  top: 10, left: 10, right: 10), //change 10 to 0
              decoration: BoxDecoration(
                color: CustomeColors.primaryColorPale,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ), //change 10 to 0
              ),
              child: UpcomingEventCard(
                releaseTitle: nxtEvent.releaseTitle,
                thumbnail: nxtEvent.thumbnail,
                category: nxtEvent.category,
                description: nxtEvent.description,
              ),
            ),
          ),
        ),
      );
    }
    print("final list");
    print(itemListr);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //  initialRoute: AppRoutes.loginRoute,
      // routes: {
      //    "/": (context) => LoginPage(),
      //   "/login": (context) => LoginPage(),
      //   AppRoutes.formRoute: (context) => FormPage(),
      //   AppRoutes.doneRoute: (context) => DonePage(),
      //   // "/otp": (context) => otpPage(),
      //   "/setpassword": (context) => setpasswordPage(),
      //   "/setforget": (context) => setforgetPage(),
      //   "/tnc": (context) => tncPage(),
      //    AppRoutes.home: (context) => HomePage(),
      //   AppRoutes.dummy: (context) =>DummyPage(),
      //   AppRoutes.dummy: (context) =>FollowUsPage(),
      //   AppRoutes.samay: (context) =>FilterChipDisplay(),
      // },
      home: Material(
        child: Scaffold(
          body: IndexedStack(
            children: <Widget>[
              //DummyPage(),
              LoginPage(),
              EventPage(),
              FollowUsPage(),
            ],
            index: _selectedIndex,
          ),
          // bottomNavigationBar: BottomNavigationBar(
          //   items: const <BottomNavigationBarItem>[
          //     BottomNavigationBarItem(
          //       icon: Icon(Icons.home),
          //       label: 'Home',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(FontAwesomeIcons.calendar),
          //       label: 'Events',
          //     ),
          //     BottomNavigationBarItem(
          //       icon: Icon(FontAwesomeIcons.twitter),
          //       label: 'Follow Us',
          //     ),
          //   ],
          //   currentIndex: _selectedIndex,
          //   selectedItemColor: Color(0xFF4A417F),
          //   onTap: _onItemTapped,
          // ),
        ),
      ),
    );
  }
}