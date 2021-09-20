import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tgf_style_guide_v2/main.dart';
import 'package:tgf_style_guide_v2/pages/event_page.dart';
import 'package:tgf_style_guide_v2/pages/follow_us.dart';
import 'package:tgf_style_guide_v2/services/demoSamayFetch.dart';
import 'package:tgf_style_guide_v2/models/bookCard.dart';
import 'package:tgf_style_guide_v2/models/eventCard.dart';
import 'package:tgf_style_guide_v2/models/upcomingEvents.dart';
import 'package:tgf_style_guide_v2/utils/variableSet.dart';
import 'package:tgf_style_guide_v2/widgets/cards.dart';
import 'package:tgf_style_guide_v2/widgets/carousel.dart';
import 'package:tgf_style_guide_v2/widgets/timer.dart';

var samayTimings;
class DummyPage extends StatefulWidget {
  DummyPage({Key? key}) : super(key: key);

  @override
  _DummyPageState createState() => _DummyPageState();
}

class _DummyPageState extends State<DummyPage> {
int _selectedIndex = 0;
  @override
  void initState() {
    super.initState();
    getTimings();
  }

  void getTimings() async {
    
    samayTimings = await getsamay();
    print('Main Samay List: ');
    print(samayTimings);
    
  }
  
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==2) {
        followUsTitle = true;
      }else {
        followUsTitle = false;
      }
    });

  }

  List<EventCard> events = ListSet.eventCardInfo;
  List<BookCardIn> books = ListSet.bookCardInfo;
  List<NextEvents> nxtEvents = ListSet.nextEvents;
  @override
  Widget build(BuildContext context) {
    Size dimention = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          title: Text(followUsTitle? 'FOLLOW US': '', style: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
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
                CupertinoIcons.bell,
                size: 30,
              ),
            ),
          ]),
      drawer: Drawer(),
      body: IndexedStack(
            children: <Widget>[
              //DummyPage(),
              LandingPage(),
              EventPage(),
              FollowUsPage(),
            ],
            index: _selectedIndex,
          ),
      bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.calendar),
                label: 'Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.twitter),
                label: 'Follow Us',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Color(0xFF4A417F),
            onTap: _onItemTapped,
          ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            child: ImageCarousel(),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 22),
            child: Text(
              "Upcoming Events".toUpperCase(),
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 16,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[800],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          CardCarousel(
            autoPlay: false,
            eventCards: ListSet.eventCardInfo,
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 22),
            child: Text(
              "Reminder".toUpperCase(),
              style: TextStyle(
                fontFamily: GoogleFonts.poppins().fontFamily,
                fontSize: 16,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[800],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 16),
                child: SamaySampana(),
              ),
              SizedBox(
                width: 17,
              ),
              Container(
                padding: EdgeInsets.only(right: 16),
                child: CountdownTimer(title: "Karmarpan"),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: EdgeInsets.only(left: 22, top: 30),
            child: Text(
              "New Releases".toUpperCase(),
              style: TextStyle(
                fontFamily: GoogleFonts.roboto().fontFamily,
                fontSize: 16,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[800],
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          // Container(
          //   height: dimention.height / 2.75,
          //   // padding: EdgeInsets.symmetric(horizontal: 22),
          //   child: ListView.separated(
          //     itemBuilder: (context, index) {
          //       NextEvents nxtEvent = nxtEvents[index];
          //       return GestureDetector(
          //         child: Container(
          //           padding: EdgeInsets.symmetric(horizontal: 22),
          //           child: UpcomingEventCard(
          //               releaseTitle: nxtEvent.releaseTitle,
          //               thumbnail: nxtEvent.thumbnail,
          //               category: nxtEvent.category,
          //               description: nxtEvent.description,
          //               url: nxtEvent.url
          //               ),
          //         ),
          //       );
          //     },
          //     separatorBuilder: (context, index) => SizedBox(
          //       height: 12,
          //     ),
          //     itemCount: nxtEvents.length,
          //   ),
          // ),
          Container(
            child: NewReleasesCarousel(),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}


