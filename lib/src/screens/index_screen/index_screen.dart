import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:irohasu/src/constants/base_content.dart';
import 'package:irohasu/src/screens/home_screens/home_screen.dart';

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
            Container(color: Colors.red,),
            Container(color: Colors.green,),
            Container(color: Colors.blue,),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.black,
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
              Content.comments,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.chat_bubble),
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
