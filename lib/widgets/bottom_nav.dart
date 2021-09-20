import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.calendar),
          label: 'Events',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.usersCog),
          label: 'Samaya Sampana',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.donate),
          label: 'Donation',
        ),
        BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.twitter),
          label: 'Follow Us',
        ),


      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Color(0xFF4A417F),
      onTap: _onItemTapped,
      type: BottomNavigationBarType.fixed,
    );
  }
}
