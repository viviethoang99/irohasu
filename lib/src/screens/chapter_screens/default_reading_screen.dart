import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../env.dart';
import '../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../helper/border_text.dart';
import '../../helper/chap_helper.dart';
import '../../helper/media_query_helper.dart';
import '../../models/chapter_model.dart';
import '../../screens/chapter_screens/webtoon_widget/custom_bottom_drawer.dart';
import '../../screens/detail_screens/manga_detail_screen.dart';
import '../setting_screen/widget/setting_chapter.dart';
import './chapter_screen.dart';

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

  final threshold = 90;

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
              debugPrint(details.velocity.pixelsPerSecond.dy.toString());
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
              var position = details.globalPosition.dx;
              if (position <= prePage) {
                (currentIndex == 0 && _getIndex != 0)
                    ? nextChapter(context, _getIndex - 1)
                    : _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn);
              } else if (position >= prePage && position <= nextPage) {
                setState(() => _showMenu = !_showMenu);
              } else {
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
                // Load image
                _imageWidget(),

                // Show Appbar
                if (_showMenu)
                  Positioned(
                    top: 0,
                    width: widthScreen,
                    height: 110,
                    child: Container(
                      // padding: const EdgeInsets.symmetric(vertical: 10),
                      child: AppBar(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          onPressed: () => btnMangaDetail(context),
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
                      totalImage: data.totalImage,
                      onShowListManga: (bool data) {
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
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
        endpoint: _getChapterList[chapter].chapterEndpoint.toString(),
        chapterList: _getChapterList,
      ),
    );
  }

  void btnMangaDetail(BuildContext context) {
    Navigator.of(context).pushNamed(
      MangaDetailScreen.routeName,
      arguments: widget.data.mangaDetail,
    );
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
