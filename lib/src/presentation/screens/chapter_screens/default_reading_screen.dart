import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../../env.dart';
import '../../../config/config.dart';
import '../../../core/helper/size_config.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/horizontal_mode_bloc/horizatal_mode_bloc.dart';
import 'default_screen_widget/list_chaper_widget.dart';
import 'default_screen_widget/process.dart';

class HorizontalReadingWidget extends StatefulWidget {
  const HorizontalReadingWidget();

  @override
  _HorizontalReadingWidgetState createState() =>
      _HorizontalReadingWidgetState();
}

class _HorizontalReadingWidgetState extends State<HorizontalReadingWidget>
    with TickerProviderStateMixin {
  late final HorizatalModeBloc _cubit;
  late final SnappingSheetController snappingSheetController;
  //Declare Globaly
  String? directory;
  List file = [];

  @override
  void initState() {
    _cubit = HorizatalModeBloc();
    snappingSheetController = SnappingSheetController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HorizatalModeBloc>(
      create: (context) => _cubit,
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SnappingSheet(
              controller: snappingSheetController,
              lockOverflowDrag: true,
              onSnapStart: (positionData, snappingPosition) {},
              snappingPositions: [
                const SnappingPosition.factor(
                  snappingCurve: Curves.elasticOut,
                  snappingDuration: Duration(milliseconds: 1750),
                  positionFactor: -1,
                ),
                const SnappingPosition.factor(
                  positionFactor: 0.0,
                  snappingCurve: Curves.easeOutExpo,
                  snappingDuration: Duration(seconds: 1),
                  grabbingContentOffset: GrabbingContentOffset.top,
                ),
                const SnappingPosition.factor(
                  snappingCurve: Curves.elasticOut,
                  snappingDuration: Duration(milliseconds: 1750),
                  positionFactor: 0.5,
                ),
              ],
              onSheetMoved: (sheetPosition) {
                _cubit.add(SheetMovedChange(
                  relativeToSheetHeight: sheetPosition.relativeToSheetHeight,
                  currentPosition: sheetPosition.pixels,
                ));
              },
              grabbing: GrabbingWidget(),
              grabbingHeight: 60,
              sheetBelow: SnappingSheetContent(
                draggable: true,
                child: const ListChapterWidget(),
              ),
              child: BlocListener<HorizatalModeBloc, HorizatalModeState>(
                listenWhen: (pre, cur) => pre.showInfo != cur.showInfo,
                listener: (context, state) {
                  if (state.showInfo) {
                    snappingSheetController
                        .snapToPosition(const SnappingPosition.factor(
                      positionFactor: 0.0,
                      snappingCurve: Curves.easeOutExpo,
                      snappingDuration: Duration(seconds: 1),
                      grabbingContentOffset: GrabbingContentOffset.top,
                    ));
                  } else {
                    snappingSheetController.setSnappingSheetFactor(-.5);
                  }
                },
                child: const ShowImageFromAPI(),
              ),
            ),
            const _AppBarWidget(),
            const ProcessReadingChapter(),
          ],
        ),
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
    return BlocBuilder<HorizatalModeBloc, HorizatalModeState>(
      builder: (context, state) {
        final theme = Theme.of(context);
        return AnimatedPositioned(
          duration: const Duration(milliseconds: 500),
          top: state.showInfo ? 0 : -200,
          width: SizeConfig.screenWidth,
          height: Constants.heightAppBar,
          child: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: theme.primaryColor,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            backgroundColor: theme.backgroundColor.withOpacity(0.9),
            elevation: 0,
            title: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
              builder: (context, state) {
                return Column(
                  children: <Widget>[
                    Text(
                      state.mangaDetail!.title.length > 30
                          ? '${state.mangaDetail!.title.substring(0, 30)}..'
                          : state.mangaDetail!.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: theme.primaryColor,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      context.read<ChapterScreenCubit>().nameChapter,
                      style: TextStyle(
                        color: theme.primaryColor.withOpacity(0.5),
                        fontSize: 15,
                      ),
                    ),
                    // const SizedBox(height: 20)
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class ShowImageFromAPI extends StatefulWidget {
  const ShowImageFromAPI({Key? key}) : super(key: key);

  @override
  State<ShowImageFromAPI> createState() => _ShowImageFromAPIState();
}

class _ShowImageFromAPIState extends State<ShowImageFromAPI> {
  late final PageController _pageController;
  late int page;

  @override
  void initState() {
    _pageController = PageController();
    page = 0;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final prePage = SizeConfig.screenWidth * 0.3;
    final nextPage = SizeConfig.screenWidth * 0.7;
    return BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
      builder: (_, state) {
        return GestureDetector(
          onTapDown: (details) {
            final possion = details.globalPosition.dx;
            if (possion < prePage) {
              _pageController.jumpToPage(page - 1);
            } else if (possion > nextPage) {
              _pageController.jumpToPage(page + 1);
            } else {
              context.read<HorizatalModeBloc>().add(ShowInfo());
            }
          },
          child: PhotoViewGallery.builder(
            itemCount: state.chapter!.listImage!.length,
            pageController: _pageController,
            scrollPhysics: const BouncingScrollPhysics(),
            builder: (context, index) {
              final image = state.chapter?.listImage?[index];
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
            onPageChanged: (value) {
              setState(() => page = value);
            },
            loadingBuilder: (context, event) => Center(
              child: Container(
                width: 20.0,
                height: 20.0,
                child: const CircularProgressIndicator(),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width: SizeConfig.screenWidth,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: theme.backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 3,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.format_list_numbered_rounded,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.question_answer_rounded,
                color: theme.primaryColor,
              ),
              Icon(
                Icons.tune_rounded,
                color: theme.primaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
