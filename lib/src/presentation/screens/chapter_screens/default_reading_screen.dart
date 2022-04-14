import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../../core/core.dart';
import '../../../../env.dart';
import '../../../config/config.dart';
import '../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../blocs/horizontal_mode_bloc/horizatal_mode_bloc.dart';
import '../../blocs/manage_page_in_chapter/manage_page_in_chapter_cubit.dart';
import '../../blocs/manga_info_bloc/manga_info_cubit.dart';
import 'default_screen_widget/list_chaper_widget.dart';
import 'default_screen_widget/process.dart';

part 'default_screen_widget/app_bar_widget.dart';
part 'default_screen_widget/show_chapter_from_api.dart';

class HorizontalReadingWidget extends StatefulWidget {
  const HorizontalReadingWidget({Key? key}) : super(key: key);

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
  List file = <File>[];

  @override
  void initState() {
    _cubit = HorizatalModeBloc();
    snappingSheetController = SnappingSheetController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final page = context.watch<ChapterScreenCubit>().state.chapter?.listImage;
    return MultiBlocProvider(
      providers: [
        BlocProvider<HorizatalModeBloc>(
          create: (context) => _cubit,
        ),
        BlocProvider(
          create: (_) => getIt<ManagePagesCubit>(
            param1: 0,
            param2: page?.length ?? 1,
          ),
        ),
      ],
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            SnappingSheet(
              controller: snappingSheetController,
              lockOverflowDrag: true,
              snappingPositions: const [
                SnappingPosition.factor(
                  snappingCurve: Curves.elasticOut,
                  snappingDuration: Duration(milliseconds: 1750),
                  positionFactor: -1,
                ),
                SnappingPosition.factor(
                  positionFactor: 0.0,
                  snappingCurve: Curves.easeOutExpo,
                  snappingDuration: Duration(seconds: 1),
                  grabbingContentOffset: GrabbingContentOffset.top,
                ),
                SnappingPosition.factor(
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
              grabbing: const GrabbingWidget(),
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
                child: const _ShowChapterFromAPI(),
              ),
            ),
            const _AppBarWidget(),
            const ProcessReadingChapter(),
          ],
        ),
      ),
    );
  }
}

class GrabbingWidget extends StatelessWidget {
  const GrabbingWidget({Key? key}) : super(key: key);

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
