import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../src/blocs/chapter_bloc/bloc.dart';
import '../../../src/constants/base_blogtruyen.dart';
import '../../../src/ui/detail_screens/manga_detail_screen.dart';

class ChapterScreen extends StatefulWidget {
  ChapterScreen({
    Key key,
    @required this.endpoint,
    @required this.chapterList,
  }) : super(key: key);
  static const routeName = '/chapter';
  final String endpoint;
  final List chapterList;

  @override
  _ChapterScreenState createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
  ChapterBloc _chapterBloc;
  ScrollController _scrollController;
  final scrollDirection = Axis.vertical;
  ItemScrollController _scrollListController;
  int _getIndex;
  double _offset, _delta = 0, _oldOffset = 0;
  final double _containerMaxHeight = 56;
  String get getEndpoint => widget.endpoint;

  List get getChapterList => widget.chapterList.reversed.toList();

  @override
  void initState() {
    super.initState();
    _chapterBloc = BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(endpoint: getEndpoint));
    _offset = 0;
    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          var offset = _scrollController.offset;
          _delta += (offset - _oldOffset);
          if (_delta > _containerMaxHeight)
            _delta = _containerMaxHeight;
          else if (_delta < 0) _delta = 0;
          _oldOffset = offset;
          _offset = -_delta;
        });
      });
    _getIndex = getChapterList.indexWhere(
        (dynamic element) => element.chapterEndpoint == getEndpoint);
    _scrollListController = ItemScrollController();
  }

  void btnNextChapter() {

  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterBloc, ChapterState>(
      builder: (context, state) {
        if (state is ChapterLoadingState) {
          return Container(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (state is InitialChapterState) {
          return const Center(
            child: Text('Waiting!'),
          );
        }
        if (state is ChapterLoadedState) {
          return SafeArea(
            child: Scaffold(
              body: LayoutBuilder(builder: (context, constraints) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Container(
                      child: ListView.builder(
                        physics: const ClampingScrollPhysics(),
                        controller: _scrollController,
                        itemBuilder: (context, index) {
                          return Image.network(
                            state.data.listImageChapter[index].chapterImageLink,
                            headers: BlogTruyen.headersBuilder,
                          );
                        },
                        itemCount: state.data.listImageChapter.length,
                      ),
                    ),
                    Positioned(
                      bottom: _offset,
                      width: constraints.maxWidth,
                      child: Container(
                        width: double.infinity,
                        height: _containerMaxHeight,
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                                icon: const Icon(Icons.skip_previous),
                                color: Colors.black87,
                                iconSize: 35,
                                onPressed: () {
                                  Navigator.of(context).pushNamed(
                                    ChapterScreen.routeName,
                                    arguments: ChapterScreen(
                                      endpoint: getChapterList[_getIndex - 1]
                                          .chapterEndpoint
                                          .toString(),
                                      chapterList: getChapterList,
                                    ),
                                  );
                                }),
                            IconButton(
                              icon: const Icon(Icons.home),
                              color: Colors.black87,
                              iconSize: 35,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                    MangaDetailScreen.routeName,
                                    arguments: state.data.mangaDetail);
                              },
                            ),
                            IconButton(
                                icon: const Icon(Icons.view_list),
                                color: Colors.black87,
                                iconSize: 35,
                                onPressed: () {
                                  Scaffold.of(context).openDrawer();
                                  SchedulerBinding.instance
                                      .addPostFrameCallback((_) {
                                    _scrollListController.jumpTo(
                                        index: _getIndex, alignment: 0.5);
                                  });
                                }),
                            IconButton(
                              icon: const Icon(Icons.skip_next),
                              color: Colors.black87,
                              iconSize: 35,
                              onPressed: () {
                                Navigator.of(context).pushNamed(
                                  ChapterScreen.routeName,
                                  arguments: ChapterScreen(
                                    endpoint: getChapterList[_getIndex + 1]
                                        .chapterEndpoint
                                        .toString(),
                                    chapterList: getChapterList,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
              drawer: Container(
                padding: const EdgeInsets.only(left: 8),
                width: MediaQuery.of(context).size.width * 0.65,
                height: MediaQuery.of(context).size.height,
                color: Colors.black87,
                child: ScrollablePositionedList.builder(
                  itemScrollController: _scrollListController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      selected: (index == _getIndex),
                      selectedTileColor: Colors.green,
                      title: Text(
                        getChapterList[index].chapterTitle.toString(),
                        style:
                            const TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          ChapterScreen.routeName,
                          arguments: ChapterScreen(
                            endpoint: getChapterList[index]
                                .chapterEndpoint
                                .toString(),
                            chapterList: getChapterList,
                          ),
                        );
                      },
                    );
                  },
                  itemCount: getChapterList.length,
                ),
              ),
            ),
          );
        }
        return const Center(child: Text('Other states..'));
      },
    );
  }
}
