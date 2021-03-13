import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../env.dart';
import '../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../blocs/chapter_bloc/bloc.dart';
import '../../helper/border_text.dart';
import '../../helper/chap_helper.dart';
import '../../helper/media_query_helper.dart';
import '../../models/chapter_model.dart';
import '../../service/history_data.dart';
import '../setting_screen/widget/setting_chapter.dart';
import 'default_screen_widget/custom_bottom_drawer.dart';


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
  String get _getEndpoint => '/api/chapter/${widget.endpoint}';

  List get _getChapterList => widget.chapterList.toList();

  ChapterModel get data => widget.data;

  final threshold = 90;
  final heightAppBar = 110.0;
  bool _showBottomMenu = false;

  @override
  void initState() {
    super.initState();
    _getIndex = _getChapterList.indexWhere(
      (element) => element.chapterEndpoint == _getEndpoint,
    );
    _scrollListController = ItemScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _pageController = PageController(initialPage: currentIndex);
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
        backgroundColor: state.color ?? Colors.red,
        body: LayoutBuilder(builder: (context, constraints) {
          return GestureDetector(
            onPanEnd: (details) {
              if (details.velocity.pixelsPerSecond.dy > threshold) {
                setState(() {
                  _showBottomMenu = false;
                });
              } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
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
                (currentIndex == 0 && _getIndex != 0)
                    ? nextChapter(context, _getIndex - 1)
                    : _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
              } else if (positionX >= prePage &&
                  positionX <= nextPage &&
                  positionY > heightAppBar) {
                setState(() => _showMenu = !_showMenu);
              } else if (positionY > heightAppBar) {
                currentIndex == data.listImageChapter.length - 1
                    ? nextChapter(context, _getIndex + 1)
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
                _imageWidget(),

                // Show Appbar
                if (_showMenu)
                  Positioned(
                    top: 0,
                    width: widthScreen,
                    height: heightAppBar,
                    child: Container(
                      // padding: const EdgeInsets.symmetric(vertical: 10),
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
                                  color: Colors.white),
                            ),
                            Text(
                              ChapHelper.removeNameManga(
                                titleChapter:
                                    _getChapterList[_getIndex].chapterTitle,
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
                              Navigator.of(context)
                                  .pushNamed(SettingChapter.routeName);
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
                          '${currentIndex + 1} / ${data.totalImage}',
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
                  Positioned(
                    left: 0,
                    bottom: _showBottomMenu ? -70 : -(heightScreen * 0.5),
                    child: CustomBottomDrawer(
                      chapterList: widget.chapterList,
                      scrollListController: _scrollListController,
                      currentIndex: currentIndex,
                      idChapter: data.idChapter,
                      idManga: data.mangaDetail.split('/')[4],
                      totalImage: data.totalImage,
                      onShowListManga: (bool data) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          _scrollListController.jumpTo(
                              index: _getIndex, alignment: 0.4);
                        });
                        setState(() {
                          _showBottomMenu = data;
                        });
                      },
                    ),
                  ),
              ],
            ),
          );
        }),
      );
    });
  }

  Widget _imageWidget() {
    return ExtendedImageGesturePageView.builder(
      itemCount: data.listImageChapter.length,
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

  void nextChapter(BuildContext context, int chapter) {
    HistoryData.addChapToHistory(
      idManga: data.mangaDetail.split('/')[4],
      idChapter: _getChapterList[chapter].idChapter,
    );
    BlocProvider.of<ChapterBloc>(context)
      ..add(FetchDataChapterEvent(
          endpoint: _getChapterList[chapter].chapterEndpoint));
  }

  ItemScrollController _scrollListController;
  int _getIndex;
  Animation<double> _animation;
  AnimationController _animationController;
  AnimationListener _animationListener;
  int currentIndex = 0;
  bool _showMenu = false;
  PageController _pageController;
}
