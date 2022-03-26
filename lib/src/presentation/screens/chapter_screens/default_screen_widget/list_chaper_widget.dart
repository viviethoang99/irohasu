import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/core.dart';
import '../../../blocs/chapter_screen/chapter_screen_cubit.dart';

class ListChapterWidget extends StatelessWidget {
  const ListChapterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      child: BlocBuilder<ChapterScreenCubit, ChapterScreenState>(
        builder: (context, state) {
          return ScrollablePositionedList.builder(
            itemCount: state.mangaDetail!.listChapter!.length,
            // itemScrollController: controller,
            itemBuilder: (context, index) {
              final chapter = state.mangaDetail!.listChapter![index];
              final isSelect = state.chapter?.endpoint == chapter.endpoint;
              return ListTile(
                title: Text(
                  chapter.title?.trim() ?? '',
                  style: TextStyle(
                    fontSize: 12,
                    color: theme.primaryColor,
                    fontWeight: isSelect ? FontWeight.bold : FontWeight.w400,
                  ),
                ),
                subtitle: Text(
                  ConvertDateTime.dateTimeToString(chapter.createAt!),
                  style: TextStyle(
                    fontSize: 10,
                    color: theme.primaryColor,
                    fontStyle: FontStyle.italic,
                    fontWeight: isSelect ? FontWeight.bold : FontWeight.w400,
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
      ),
    );
  }
}
