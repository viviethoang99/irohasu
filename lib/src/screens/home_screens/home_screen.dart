import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Widget
import '../../blocs/list_manga_bloc/bloc.dart';
import '../../components/loading_screen.dart';
import './list_manga_widget.dart';
import './widget/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ListMangaBloc _listMangaBloc;

  // Scroll Controller
  ScrollController _scrollController;
  final _scrollThreshold = 300.0;

  @override
  void initState() {
    super.initState();
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
              if (state is ListMangaLoadedState) {
                return ListMangaWidget(
                  scrollController: _scrollController,
                  data: state.data,
                  hasReachedEnd: state.hasReachedEnd,
                );
              }
              return Container();
              //never run this line, only fix warning.
            }),
          ),
        ],
      ),
    );
  }
}
