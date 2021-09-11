import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../config/constants.dart';
import '../../models/chapter_model.dart';
import '../chapter_screen/chapter_screen_cubit.dart';

part 'horizontal_reading_state.dart';

class HorizontalReadingCubit extends Cubit<HorizontalReadingState> {
  HorizontalReadingCubit({
    required this.chapterCubit,
    required this.scrollController,
    required this.pageController,
  }) : super(HorizontalReadingState(
          scrollController: scrollController,
          pageController: pageController,
        ));

  final ChapterScreenCubit chapterCubit;
  final ItemScrollController scrollController;
  final PageController pageController;

  final threshold = 90;

  void initload() => emit(state.copyWith(chapter: chapterCubit.state.chapter));

  void showMenu(bool value) => emit(state.copyWith(showMenu: value));

  void showBottomMenu(bool value) {
    emit(state.copyWith(showBottomMenu: value));
  }

  void changeIndexPage(int value) {
    emit(state.copyWith(indexPage: value));
  }

  void onPanEndEvent(DragEndDetails details) {
    if (details.velocity.pixelsPerSecond.dy > threshold) {
      showBottomMenu(false);
    } else if (details.velocity.pixelsPerSecond.dy < -threshold) {
      jumpToIndex();
    }
  }

  void jumpToIndex() {
    SchedulerBinding.instance!.addPostFrameCallback((_) {
      state.scrollController.jumpTo(
        index: chapterCubit.state.indexChapter,
        alignment: 0.4,
      );
    });
    showBottomMenu(true);
  }

  void onTapDownEvent({
    required TapDownDetails details,
    required double left,
    required double right,
  }) {
    showBottomMenu(false);
    final positionX = details.globalPosition.dx;
    final positionY = details.globalPosition.dy;
    if (positionX <= left && positionY > Constants.heightAppBar) {
      (state.indexPage == 0 && chapterCubit.indexChapter != 0)
          ? chapterCubit.preChapter()
          : state.pageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
    } else if (positionX >= left &&
        positionX <= right &&
        positionY > Constants.heightAppBar) {
      showMenu(!state.showMenu);
    } else if (positionY > Constants.heightAppBar) {
      state.indexPage == state.chapter!.listImage!.length - 1
          ? chapterCubit.nextChapter()
          : state.pageController.nextPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeIn);
    }
  }
}
