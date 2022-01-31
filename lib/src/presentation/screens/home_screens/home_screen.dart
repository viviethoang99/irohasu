import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/list_manga_bloc/bloc.dart';
import '../../widgets/loading_screen.dart';
import 'list_manga_widget.dart';
import 'widget/appbar_widget.dart';

class ListMangaScreen extends StatefulWidget {
  const ListMangaScreen();

  static const routeName = '/home';

  @override
  _ListMangaScreenState createState() => _ListMangaScreenState();
}

class _ListMangaScreenState extends State<ListMangaScreen> {
  // Scroll Controller
  ScrollController? _scrollController;
  final _scrollThreshold = 300.0;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListMangaBloc>(context).add(InitialFetchMangaEvent());
    _scrollController = ScrollController()
      ..addListener(() {
        final maxScrollExtent = _scrollController!.position.maxScrollExtent;
        final currentScroll = _scrollController!.position.pixels;
        if (maxScrollExtent - currentScroll <= _scrollThreshold) {
          BlocProvider.of<ListMangaBloc>(context).add(FetchListMangaEvent());
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
              if (state is InitialListMangaState) return Container();
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
              // if (state is ListMangaFailureState) {
              return Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.wifi_off,
                        size: 120,
                        color: Theme.of(context).primaryColor,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Flexible(
                        child: Text(
                          'Không thể kết nối mạng. \n'
                          'Vui lòng thử lại.',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              );
              // }
              // return Container();
              //never run this line, only fix warning.
            }),
          ),
        ],
      ),
    );
  }
}
