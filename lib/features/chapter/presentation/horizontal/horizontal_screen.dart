import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:snapping_sheet/snapping_sheet.dart';

import '../../../../config/config.dart';
import '../../../../core/core.dart';
import '../../../../env.dart';
import '../../chapter.dart';
import 'widget/list_chaper_widget.dart';
import 'widget/process.dart';

part 'widget/app_bar_widget.dart';
part 'widget/show_chapter_from_api.dart';
part 'widget/grabbing_widget.dart';

class HorizontalScreen extends StatefulWidget {
  const HorizontalScreen({Key? key}) : super(key: key);

  @override
  State<HorizontalScreen> createState() => _HorizontalScreenState();
}

class _HorizontalScreenState extends State<HorizontalScreen>
    with TickerProviderStateMixin {
  late final HorizatalModeBloc _cubit;
  late final SnappingSheetController snappingSheetController;

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
