import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../constants/base_blogtruyen.dart';
import '../../models/chapter_model.dart';
import '../chapter_screens/setting_chapter.dart';
import './chapter_screen.dart';
import './webtoon_widget/drawer_widget.dart';

typedef AnimationListener = void Function();

class HorizontalReadingWidget extends StatefulWidget {
  const HorizontalReadingWidget({this.data, this.endpoint, this.chapterList});

  final ChapterModel data;
  final String endpoint;
  final List chapterList;

  @override
  _HorizontalReadingWidgetState createState() =>
      _HorizontalReadingWidgetState();
}

class _HorizontalReadingWidgetState extends State<HorizontalReadingWidget>
    with TickerProviderStateMixin {
  String get _getEndpoint => widget.endpoint;

  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;

  @override
  void initState() {
    super.initState();
    _getIndex = _getChapterList.indexWhere(
        (dynamic element) => element.chapterEndpoint == _getEndpoint);
    _scrollListController = ItemScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pageController = PageController(initialPage: currentIndex);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: LayoutBuilder(builder: (context, constraints) {
        return GestureDetector(
          onTapDown: (TapDownDetails details) {
            var widthScreen = MediaQuery.of(context).size.width;
            var x = details.globalPosition.dx;
            if (x <= widthScreen * 0.35) {
              currentIndex == 0
                  ? Navigator.of(context).pushNamed(
                      ChapterScreen.routeName,
                      arguments: ChapterScreen(
                        endpoint: _getChapterList[_getIndex - 1]
                            .chapterEndpoint
                            .toString(),
                        chapterList: _getChapterList,
                      ),
                    )
                  : setState(() {
                      _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
            } else if (x <= widthScreen * 0.65 && x > widthScreen * 0.35) {
              setState(() {
                _showMenu = !_showMenu;
              });
            } else {
              currentIndex == data.listImageChapter.length - 1
                  ? Navigator.of(context).pushNamed(
                      ChapterScreen.routeName,
                      arguments: ChapterScreen(
                        endpoint: _getChapterList[_getIndex + 1]
                            .chapterEndpoint
                            .toString(),
                        chapterList: _getChapterList,
                      ),
                    )
                  : setState(() {
                      _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn);
                    });
            }
          },
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              ExtendedImageGesturePageView.builder(
                itemCount: data.listImageChapter.length,
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemBuilder: (context, i) {
                  return ExtendedImage.network(
                    data.listImageChapter[i].chapterImageLink,
                    headers: BlogTruyen.headersBuilder,
                    onDoubleTap: (state) {
                      Offset pointerDownPosition;
                      pointerDownPosition = state.pointerDownPosition;
                      final begin = state.gestureDetails.totalScale;
                      double end;

                      _animation?.removeListener(_animationListener);
                      _animationController.stop();
                      _animationController.reset();

                      (begin == 1.0) ? end = 2.0 : end = 1.0;

                      _animationListener = () {
                        state.handleDoubleTap(
                            scale: _animation.value,
                            doubleTapPosition: pointerDownPosition);
                      };

                      _animation = _animationController
                          .drive(Tween<double>(begin: begin, end: end));
                      _animationController.addListener(_animationListener);
                      _animationController.forward();
                    },
                    mode: ExtendedImageMode.gesture,
                    initGestureConfigHandler: (state) => GestureConfig(
                      minScale: 0.9,
                      animationMinScale: 0.7,
                      maxScale: 3.0,
                      animationMaxScale: 3.5,
                      speed: 1.0,
                      inertialSpeed: 100.0,
                      initialScale: 1.0,
                      inPageView: true,
                      cacheGesture: false,
                    ),
                  );
                },
                onPageChanged: (value) {
                  setState(() {
                    // print('Checkpoint');
                    currentIndex = value;
                  });
                },
                physics: const BouncingScrollPhysics(),
              ),
              if (_showMenu)
                Positioned(
                  top: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: AppBar(
                      centerTitle: false,
                      backgroundColor: Colors.black.withOpacity(0.8),
                      elevation: 0,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            data.title.length > 25
                                ? '${data.title.substring(0, 25)}..'
                                : data.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            _getChapterList[_getIndex].chapterTitle.toString(),
                            style: const TextStyle(color: Colors.grey),
                          ),
                          const SizedBox(height: 10)
                        ],
                      ),
                      actions: <Widget>[
                        IconButton(
                          icon: const Icon(
                            Icons.settings,
                            size: 35,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SettingChapter.routeName);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              if (_showMenu)
                DrawerHorizontalWidget(
                  indexChapter: _getIndex,
                  indexPage: currentIndex,
                  listChapter: _getChapterList,
                  height: MediaQuery.of(context).size.height,
                  totalImage: data.listImageChapter.length,
                  scrollListController: _scrollListController,
                ),
            ],
          ),
        );
      }),
    );
  }

  var settingChapter = Hive.box<String>('settingChapter');
  final ScrollController _scrollController = ScrollController();
  final scrollDirection = Axis.vertical;
  ItemScrollController _scrollListController;
  int _getIndex;
  Animation<double> _animation;
  AnimationController _animationController;
  AnimationListener _animationListener;
  int currentIndex = 0;
  bool _showMenu = false;
  PageController _pageController;
}
