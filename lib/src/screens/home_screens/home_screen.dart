import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget
import '../../../src/components/loading_screen.dart';
import '../../../src/constants/base_content.dart';
import '../../blocs/list_manga_bloc/bloc.dart';
import 'widget/appbar_widget.dart';
import './list_manga_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/recent';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListMangaBloc _listMangaBloc;

  // Scroll Controller
  ScrollController _scrollController;
  final _scrollThreshold = 300.0;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _listMangaBloc = BlocProvider.of<ListMangaBloc>(context)
      ..add(FetchListMangaEvent());
    _scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = _scrollController.position.maxScrollExtent;
        final currentScroll = _scrollController.position.pixels;
        if (maxScrollExtent - currentScroll <= _scrollThreshold) {
          _listMangaBloc = BlocProvider.of<ListMangaBloc>(context)
            ..add(FetchListMangaEvent());
        }
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBarHomeWidget(),
            body: BlocBuilder<ListMangaBloc, ListMangaState>(
                builder: (context, state) {
              if (state is ListMangaLoadingState) {
                return LoadingScreen();
              }
              if (state is InitialListMangaState) {
                return const Center(child: Text('Hi hi Dang loading'));
              }
              if (state is ListMangaLoadedState) {
                return ListMangaWidget(
                  scrollController: _scrollController,
                  data: state.data,
                  hasReachedEnd: state.hasReachedEnd,
                );
              }
              return const Center(child: Text('Other states..'));
              //never run this line, only fix warning.
            }),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavyBar(
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
