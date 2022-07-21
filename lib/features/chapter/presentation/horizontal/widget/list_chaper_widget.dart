import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../core/core.dart';
import '../../../chapter.dart';



class ListChapterWidget extends StatelessWidget {
  const ListChapterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.backgroundColor,
      child: BlocBuilder<MangaInfoCubit, MangaInfoState>(
        builder: (context, state) {
          return ScrollablePositionedList.builder(
            itemCount: state.listChapter!.length,
            itemBuilder: (context, index) {
              final chapter = state.listChapter![index];
              final isSelect = state.endpoint == chapter.endpoint;
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
                  chapter.createAt.dateToString(),
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
