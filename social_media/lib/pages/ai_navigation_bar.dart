import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        Navigator.pushReplacementNamed(context, "/homePage");
      } else if (_selectedIndex == 1) {
        Navigator.pushReplacementNamed(context, "/searchPage");
      } else if (_selectedIndex == 2) {
        Navigator.pushReplacementNamed(context, "/reelsPage");
      } else if (_selectedIndex == 3) {
        Navigator.pushReplacementNamed(context, "/notificationPage");
      } else if (_selectedIndex == 4) {
        Navigator.pushReplacementNamed(context, "/profilePage");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: [
        const BottomNavigationBarItem(
          backgroundColor: Colors.white10,
          icon: Icon(Icons.home, color: Colors.black),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
            label: 'Search',
            backgroundColor: Colors.black12,
            icon: Icon(Icons.search, color: Colors.black)),
        const BottomNavigationBarItem(
          backgroundColor: Colors.black12,
          icon: Icon(CupertinoIcons.camera, color: Colors.black),
          label: 'Reels',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.white,
          icon: Icon(
            Icons.favorite_border,
            color: Colors.black,
          ),
          label: 'Favorites',
        ),
        const BottomNavigationBarItem(
          backgroundColor: Colors.black12,
          icon: Icon(Icons.person, color: Colors.black),
          label: 'Profile',
        ),
      ],
    );
  }
}
