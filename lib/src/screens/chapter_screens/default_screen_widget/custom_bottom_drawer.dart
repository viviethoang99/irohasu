import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../blocs/chapter_screen/chapter_screen_cubit.dart';
import '../../../blocs/horizontal_reading_cubit/horizontal_reading_cubit.dart';
import '../../../helper/convert_date_time.dart';
import '../../../helper/size_config.dart';
import 'step_progress_bar.dart';

class CustomBottomDrawer extends StatelessWidget {
  const CustomBottomDrawer();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HorizontalReadingCubit, HorizontalReadingState>(
      builder: (context, state) {
        if (state.showMenu) {
          return AnimatedPositioned(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 300),
            left: 0,
            bottom:
                state.showBottomMenu ? -70 : -SizeConfig.screenHeight * 0.5 + 5,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(20),
              ),
              child: Container(
                color: Colors.black87,
                width: SizeConfig.screenWidth,
                height: SizeConfig.screenHeight * 0.5 + 70,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: IconButton(
                            icon: const Icon(
                              Icons.format_list_numbered,
                              color: Colors.white70,
                              size: 33,
                            ),
                            onPressed: () {
                              context
                                  .read<HorizontalReadingCubit>()
                                  .jumpToIndex();
                            },
                          ),
                        ),
                        Expanded(
                          child: StepProgressBar(
                            currentStep: state.indexPage,
                            totalSteps: state.chapter!.listImage!.length,
                          ),
                        ),
                        BlocBuilder<HorizontalReadingCubit,
                            HorizontalReadingState>(
                          builder: (_, state) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 12.0),
                              child: Text(
                                '${state.indexPage + 1} / '
                                '${state.chapter!.listImage!.length}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    const Divider(
                      height: 2.0,
                      color: Colors.green,
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ).copyWith(bottom: 90),
                        child: _ListChapterWidget(
                          controller: state.scrollController,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}

class _ListChapterWidget extends StatelessWidget {
  const _ListChapterWidget({Key? key, this.controller}) : super(key: key);

  final ItemScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
      builder: (context, state) {
        final getIndex = context.read<ChapterScreenCubit>().indexChapter;
        return ScrollablePositionedList.builder(
          itemCount: state.mangaDetail!.listChapter!.length,
          itemScrollController: controller,
          itemBuilder: (context, index) {
            final chapter = state.mangaDetail!.listChapter![index];
            return ListTile(
              selected: (index == getIndex),
              selectedTileColor: Colors.green,
              title: Text(
                chapter.title?.trim() ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                ConvertDateTime.dateTimeToString(chapter.createAt!),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              onTap: () {
                context
                    .read<ChapterScreenCubit>()
                    .fetchDataFromApi(chapter.endpoint!);
              },
            );
          },
        );
      },
    );
  }
}
