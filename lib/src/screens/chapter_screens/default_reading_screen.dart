import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../env.dart';
import '../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/horizontal_reading_cubit/horizontal_reading_cubit.dart';
import '../../config/config.dart';
import '../../helper/border_text.dart';
import '../../helper/size_config.dart';
import '../setting_screen/widget/setting_chapter.dart';
import 'default_screen_widget/custom_bottom_drawer.dart';

typedef AnimationListener = void Function();

class HorizontalReadingWidget extends StatefulWidget {
  const HorizontalReadingWidget();

  @override
  _HorizontalReadingWidgetState createState() =>
      _HorizontalReadingWidgetState();
}

class _HorizontalReadingWidgetState extends State<HorizontalReadingWidget>
    with TickerProviderStateMixin {
  late final HorizontalReadingCubit _cubit;
  late final ItemScrollController _scrollListController;
  late final PageController _pageController;

  //Declare Globaly
  String? directory;
  List file = [];

  @override
  void initState() {
    _scrollListController = ItemScrollController();
    _pageController = PageController(initialPage: 0);
    _cubit = HorizontalReadingCubit(
      chapterCubit: context.read<ChapterScreenCubit>(),
      scrollController: _scrollListController,
      pageController: _pageController,
    )..initload();
    super.initState();

    // _getChapterList[getIndex!]?.isDownload != null
    //     ? _listofFiles()
    //     : setState(() => countImage = data!.totalImage);
  }

  // void _listofFiles() async {
  //   final directory = (await getApplicationDocumentsDirectory()).absolute.path;
  //   setState(() {
  //     file = io.Directory(directory + _getChapterList[getIndex!].isDownload)
  //         .listSync()
  //           ..sort((a, b) => AlphanumComparator.compare(a.path, b.path));
  //     countImage = file.length;
  //   });
  // }

  // @override
  // void didUpdateWidget(covariant HorizontalReadingWidget oldWidget) {
  //   _getChapterList[getIndex!]?.isDownload != null
  //       ? _listofFiles()
  //       : setState(() => countImage = data!.totalImage);
  //   super.didUpdateWidget(oldWidget);
  // }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prePage = SizeConfig.screenWidth * 0.3;
    final nextPage = SizeConfig.screenWidth * 0.7;
    return BlocProvider<HorizontalReadingCubit>(
      create: (context) => _cubit,
      child: BlocBuilder<ChangeBackgroundBloc, ChangeBackgroundState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: state.color ?? Colors.black87,
            body: GestureDetector(
              onPanEnd: context.read<HorizontalReadingCubit>().onPanEndEvent,
              onTapDown: (details) =>
                  context.read<HorizontalReadingCubit>().onTapDownEvent(
                        details: details,
                        left: prePage,
                        right: nextPage,
                      ),
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
                  (file.isNotEmpty)
                      ? _imageLocalWidget()
                      : const ShowImageFromAPI(),

                  // Show Appbar
                  const _AppBarWidget(),

                  // Show number Page
                  BlocBuilder<HorizontalReadingCubit, HorizontalReadingState>(
                    builder: (context, state) {
                      if (state.showMenu) {
                        return Positioned(
                          bottom: 20,
                          child: BorderText(
                            strokeColor: Theme.of(context).primaryColor,
                            strokeWidth: 4,
                            child: Text(
                              '${state.indexPage + 1}'
                              '/${state.chapter!.listImage!.length}',
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),

                  // Show Drawer Bottom
                  const CustomBottomDrawer(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _imageLocalWidget() {
    return Container();
    // return ExtendedImageGesturePageView.builder(
    //   itemCount: countImage,
    //   scrollDirection: Axis.horizontal,
    //   controller: _pageController,
    //   itemBuilder: (context, index) {
    //     return ExtendedImage.file(
    //       file[index],
    //       onDoubleTap: (state) {
    //         Offset? pointerDownPosition;
    //         pointerDownPosition = state.pointerDownPosition;
    //         final begin = state.gestureDetails!.totalScale;
    //         final end = (begin == 1.0) ? 2.0 : 1.0;

    //         _animation?.removeListener(_animationListener);
    //         _animationController!
    //           ..stop()
    //           ..reset();

    //         _animationListener = () {
    //           state.handleDoubleTap(
    //               scale: _animation!.value,
    //               doubleTapPosition: pointerDownPosition);
    //         };

    //         _animation = _animationController!.drive(Tween<double>(
    //           begin: begin,
    //           end: end,
    //         ));
    //         _animationController!
    //           ..addListener(_animationListener)
    //           ..forward();
    //       },
    //       mode: ExtendedImageMode.gesture,
    //       initGestureConfigHandler: (state) => ImageGestureConfig.configDefault,
    //     );
    //   },
    //   onPageChanged: context.read<HorizontalReadingCubit>().changeIndexPage,
    //   physics: const BouncingScrollPhysics(),
    // );
  }
}

class _AppBarWidget extends StatelessWidget {
  const _AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalReadingCubit, HorizontalReadingState>(
      builder: (context, state) {
        if (state.showMenu) {
          return Positioned(
            top: 0,
            width: SizeConfig.screenWidth,
            height: Constants.heightAppBar,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              centerTitle: false,
              backgroundColor: Colors.black.withOpacity(0.8),
              elevation: 0,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
                    builder: (context, state) {
                      return Text(
                        state.mangaDetail!.title.length > 25
                            ? '${state.mangaDetail!.title.substring(0, 25)}..'
                            : state.mangaDetail!.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      );
                    },
                  ),
                  BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
                    builder: (context, state) {
                      return Text(
                        context.read<ChapterScreenCubit>().nameChapter,
                        style: const TextStyle(color: Colors.grey),
                      );
                    },
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
                    Navigator.of(context).pushNamed(SettingChapter.routeName);
                  },
                )
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class ShowImageFromAPI extends StatelessWidget {
  const ShowImageFromAPI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
      builder: (_, stateChapter) {
        return BlocBuilder<HorizontalReadingCubit, HorizontalReadingState>(
          builder: (context, state) {
            return PhotoViewGallery.builder(
              itemCount: stateChapter.chapter!.listImage!.length,
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (context, index) {
                final image = stateChapter.chapter?.listImage?[index];
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(
                    image?.chapterImageLink ?? '',
                    headers: ENV.headersBuilder,
                  ),
                  minScale: PhotoViewComputedScale.contained,
                  maxScale: PhotoViewComputedScale.contained * 2,
                  initialScale: PhotoViewComputedScale.contained,
                  heroAttributes: PhotoViewHeroAttributes(
                    tag: image!.number!,
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              onPageChanged:
                  context.read<HorizontalReadingCubit>().changeIndexPage,
              loadingBuilder: (context, event) => Center(
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  child: const CircularProgressIndicator(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
