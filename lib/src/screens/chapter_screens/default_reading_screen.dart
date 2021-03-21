import 'dart:io' as io;

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../env.dart';
import '../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../helper/alphanum_comparator.dart';
import '../../helper/border_text.dart';
import '../../helper/chap_helper.dart';
import '../../helper/media_query_helper.dart';
import '../../models/chapter_model.dart';
import '../setting_screen/widget/setting_chapter.dart';
import './default_screen_widget/custom_bottom_drawer.dart';

typedef AnimationListener = void Function();

class HorizontalReadingWidget extends StatefulWidget {
  HorizontalReadingWidget({
    this.data,
    this.chapterList,
    this.indexChapter,
    this.openChapter,
  });

  final ChapterModel data;
  final List chapterList;
  final int indexChapter;
  final Function openChapter;

  @override
  _HorizontalReadingWidgetState createState() =>
      _HorizontalReadingWidgetState();
}

class _HorizontalReadingWidgetState extends State<HorizontalReadingWidget>
    with TickerProviderStateMixin {
  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;

  int get getIndex => widget.indexChapter;

  final threshold = 90;
  final heightAppBar = 110.0;
  bool _showBottomMenu = false;
  int countImage = 0;

  //Declare Globaly
  String directory;
  List file = [];

  @override
  void initState() {
    super.initState();
    _scrollListController = ItemScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pageController = PageController(initialPage: currentIndex);
    _getChapterList[getIndex]?.isDownload != null
        ? _listofFiles()
        : setState(() => countImage = data.totalImage);
  }

  void _listofFiles() async {
    final directory = (await getApplicationDocumentsDirectory()).absolute.path;
    setState(() {
      file = io.Directory(directory + _getChapterList[getIndex].isDownload)
          .listSync()
            ..sort((a, b) => AlphanumComparator.compare(a.path, b.path));
      countImage = file.length;
    });
  }

  @override
  void didUpdateWidget(covariant HorizontalReadingWidget oldWidget) {
    _getChapterList[getIndex]?.isDownload != null
        ? _listofFiles()
        : setState(() => countImage = data.totalImage);
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    super.dispose();
    _animationController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widthScreen = ScreenHelper.getWidth(context);
    final heightScreen = ScreenHelper.getHeight(context);
    final prePage = widthScreen * 0.3;
    final nextPage = widthScreen * 0.7;
    return BlocBuilder<ChangeBackgroundBloc, ChangeBackgroundState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: state.color ?? Colors.black87,
        body: LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy > threshold) {
                setState(() {
                  _showBottomMenu = false;
                });
              } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  _scrollListController.jumpTo(index: getIndex, alignment: 0.4);
                });
                setState(() {
                  _showBottomMenu = true;
                });
              }
            },
            onTapDown: (TapDownDetails details) {
              _showBottomMenu = false;
              var positionX = details.globalPosition.dx;
              var positionY = details.globalPosition.dy;
              if (positionX <= prePage && positionY > heightAppBar) {
                (currentIndex == 0 && getIndex != 0)
                    ? widget.openChapter(getIndex - 1)
                    : _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
              } else if (positionX >= prePage &&
                  positionX <= nextPage &&
                  positionY > heightAppBar) {
                setState(() => _showMenu = !_showMenu);
              } else if (positionY > heightAppBar) {
                currentIndex == countImage - 1
                    ? widget.openChapter(getIndex + 1)
                    : _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
              }
            },
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                /*
                    1, Show Image
                    2, Show AppBar if _showMenu is true
                    3, Show the page number if _showMenu is false
                    4, Show drawer bottom if _showMenu is true
                 */

                // Show Image
                (file.isNotEmpty) ? _imageLocalWidget() : _imageWidget(),

                // Show Appbar
                if (_showMenu)
                  Positioned(
                    top: 0,
                    width: widthScreen,
                    height: heightAppBar,
                    child: Container(
                      child: AppBar(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        centerTitle: false,
                        backgroundColor: Colors.black.withOpacity(0.8),
                        elevation: 0,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data.titleManga.length > 25
                                  ? '${data.titleManga.substring(0, 25)}..'
                                  : data.titleManga,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              ChapHelper.removeNameManga(
                                titleChapter:
                                    _getChapterList[getIndex].chapterTitle,
                                nameManga: data.titleManga,
                              ),
                              style: const TextStyle(color: Colors.grey),
                            ),
                            // const SizedBox(height: 20)
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
                              Navigator.of(context).pushNamed(
                                SettingChapter.routeName,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),

                // Show number Page
                if (!_showMenu)
                  Positioned(
                    bottom: 20,
                    child: Container(
                      child: BorderText(
                        child: Text(
                          '${currentIndex + 1}/$countImage',
                          style: TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        strokeColor: Theme.of(context).primaryColor,
                        strokeWidth: 4,
                      ),
                    ),
                  ),

                // Show Drawer Bottom
                if (_showMenu)
                  AnimatedPositioned(
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 300),
                    left: 0,
                    bottom: _showBottomMenu ? -70 : -(heightScreen * 0.5 + 5),
                    child: CustomBottomDrawer(
                      chapterList: widget.chapterList,
                      scrollListController: _scrollListController,
                      currentIndex: currentIndex,
                      idChapter: data.idChapter,
                      totalImage: countImage,
                      onShowListManga: (bool data) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          _scrollListController.jumpTo(
                              index: getIndex, alignment: 0.4);
                        });
                        setState(() {
                          _showBottomMenu = data;
                        });
                      },
                      openChapter: widget.openChapter,
                    ),
                  ),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget _imageLocalWidget() {
    return ExtendedImageGesturePageView.builder(
      itemCount: countImage,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemBuilder: (context, index) {
        return ExtendedImage.file(
          file[index],
          onDoubleTap: (state) {
            Offset pointerDownPosition;
            pointerDownPosition = state.pointerDownPosition;
            final begin = state.gestureDetails.totalScale;
            double end;

            _animation?.removeListener(_animationListener);
            _animationController
              ..stop()
              ..reset();

            (begin == 1.0) ? end = 2.0 : end = 1.0;

            _animationListener = () {
              state.handleDoubleTap(
                  scale: _animation.value,
                  doubleTapPosition: pointerDownPosition);
            };

            _animation = _animationController.drive(Tween<double>(
              begin: begin,
              end: end,
            ));
            _animationController
              ..addListener(_animationListener)
              ..forward();
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
        setState(() => currentIndex = value);
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _imageWidget() {
    return ExtendedImageGesturePageView.builder(
      itemCount: countImage,
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      itemBuilder: (context, i) {
        return ExtendedImage.network(
          data.listImageChapter[i].chapterImageLink,
          cache: true,
          headers: ENV.headersBuilder,
          onDoubleTap: (state) {
            Offset pointerDownPosition;
            pointerDownPosition = state.pointerDownPosition;
            final begin = state.gestureDetails.totalScale;
            double end;

            _animation?.removeListener(_animationListener);
            _animationController
              ..stop()
              ..reset();

            (begin == 1.0) ? end = 2.0 : end = 1.0;

            _animationListener = () {
              state.handleDoubleTap(
                  scale: _animation.value,
                  doubleTapPosition: pointerDownPosition);
            };

            _animation = _animationController
                .drive(Tween<double>(begin: begin, end: end));
            _animationController
              ..addListener(_animationListener)
              ..forward();
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
        setState(() => currentIndex = value);
      },
      physics: const BouncingScrollPhysics(),
    );
  }

  ItemScrollController _scrollListController;
  Animation<double> _animation;
  AnimationController _animationController;
  AnimationListener _animationListener;
  int currentIndex = 0;
  bool _showMenu = false;
  PageController _pageController;
}
