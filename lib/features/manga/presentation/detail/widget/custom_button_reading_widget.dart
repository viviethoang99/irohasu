import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/button.dart';
import '../../../../../base/text.dart';
import '../../../../../config/constants/size.dart';
import '../../../../chapter/presentation/chapter_screens/chapter_screen.dart';
import '../../../manga.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  const CustomButtonReadingWidget({
    super.key,
    this.lastChapter,
  });

  final ChapterItem? lastChapter;

  @override
  Widget build(BuildContext context) {
    if (lastChapter?.endpoint == null) {
      return IrohaText.bold(
        'Truyện hiện tại không cho chương nào',
        fontSize: FontSizes.s18,
      );
    }

    return Container(
      color: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 10,
      ),
      child: IrohaButton(
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.circular(26),
        ),
        onTap: () => _onPressed(context),
        text: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Center(
            child: IrohaText.bold(
              context.read<MangaDetailBloc>().lastChapter,
              fontSize: FontSizes.s16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  void _onPressed(BuildContext context) {
    final chapterParam = context.read<MangaDetailBloc>().params(
          lastChapter!.endpoint!,
        );
        
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(
        data: chapterParam,
      ),
    );
  }
}
