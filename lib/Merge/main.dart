import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tgf_style_guide_v2/pages/dummy.dart';
import 'package:tgf_style_guide_v2/pages/event_page.dart';
import 'package:tgf_style_guide_v2/pages/follow_us.dart';





void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(PackageApp());
}

class PackageApp extends StatefulWidget {
  const PackageApp({Key? key}) : super(key: key);
  @override
  _PackageAppState createState() => _PackageAppState();
}

class _PackageAppState extends State<PackageApp> {
  int _selectedIndex = 0;

//  final List _children = [
//    DummyPage(),
//    EventPage(),
//    FollowUsPage()
//  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Material(
        child: Scaffold(
          body: IndexedStack(
            children: <Widget>[
              DummyPage(),
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
        ),
      ),
    );
  }
}
//  @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute: AppRoutes.dummy,
//       routes: {
//         AppRoutes.home: (context) => HomePage(),
//         // AppRoutes.dummy: (context) =>DummyPage(),
//         AppRoutes.dummy: (context) =>FollowUsPage(),
//         AppRoutes.samay: (context) =>FilterChipDisplay(),
//       },
//     );
//   }
// }
