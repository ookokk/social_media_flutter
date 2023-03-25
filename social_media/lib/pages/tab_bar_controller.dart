import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:social_media/widgets/custom_app_bar.dart';
import '../utils/custom_colors.dart';

class TabBarController extends StatefulWidget {
  const TabBarController({Key? key}) : super(key: key);

  @override
  State<TabBarController> createState() => _TabBarControllerState();
}

class _TabBarControllerState extends State<TabBarController> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Instagram"),
      bottomNavigationBar: customButtonNavigationBar(),
    );
  }

  BottomNavigationBar customButtonNavigationBar() {
    return BottomNavigationBar(
      onTap: (value) {
        setState(() {
          _currentIndex = value;
        });
      },
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: CustomColors.textButtonColor,
      unselectedItemColor: CustomColors.scaffoldBackgroundColor,
      items: [
        _customBottomNavigationBarItem(CupertinoIcons.house_fill, "Home Page"),
        _customBottomNavigationBarItem(CupertinoIcons.search, "Search"),
        _customBottomNavigationBarItem(CupertinoIcons.add_circled, "Reels"),
        _customBottomNavigationBarItem(
            CupertinoIcons.shopping_cart, "Shopping"),
        _customBottomNavigationBarItem(CupertinoIcons.person, "Profile"),
      ],
    );
  }

  BottomNavigationBarItem _customBottomNavigationBarItem(
          IconData iconData, String label) =>
      BottomNavigationBarItem(icon: Icon(iconData), label: label);
}
