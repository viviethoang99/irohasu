import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import '../../constants/base_content.dart';
import '../../screens/history_screen/history_screen.dart';
import '../../screens/home_screens/home_screen.dart';
import '../../screens/library_screen/library_screen.dart';
import '../../screens/setting_screen/setting_screen.dart';

class IndexScreen extends StatefulWidget {
  static const routeName = '/';
  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            HomeScreen(),
            LibraryScreen(),
            HistoryScreen(),
            SettingScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Theme.of(context).accentColor,
        showElevation: true,
        selectedIndex: _currentIndex,
        iconSize: 30,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              Content.home,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.home),
          ),
          BottomNavyBarItem(
            title: const Text(
              Content.library,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.library_books),
          ),
          BottomNavyBarItem(
            title: const Text(
              Content.history,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.history),
          ),
          BottomNavyBarItem(
            title: const Text(
              Content.settings,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(
              Icons.settings,
            ),
          ),
        ],
      ),
    );
  }
}
