import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../config/base_content.dart';
import '../../blocs/manage_favorite_manga/manage_favorite_manga_bloc.dart';
import '../history_screen/history_screen.dart';
import '../home_screens/home_screen.dart';
import '../library_screen/library_screen.dart';
import '../setting_screen/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();
    context.read<ManageFavoriteMangaBloc>().add(GetListFavoriteId());
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController?.dispose();
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
          children: const <Widget>[
            ListMangaScreen(),
            LibraryScreen(),
            SettingScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Theme.of(context).backgroundColor,
        showElevation: true,
        selectedIndex: _currentIndex,
        iconSize: 30,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text(
              ConstantStrings.home,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.home),
          ),
          BottomNavyBarItem(
            title: const Text(
              ConstantStrings.library,
              style: TextStyle(fontSize: 15),
            ),
            icon: const Icon(Icons.library_books),
          ),
          BottomNavyBarItem(
            title: const Text(
              ConstantStrings.settings,
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
