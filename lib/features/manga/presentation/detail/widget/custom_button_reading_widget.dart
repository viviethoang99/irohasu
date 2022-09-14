import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../chapter/presentation/chapter_screens/chapter_screen.dart';
import '../../../manga.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  const CustomButtonReadingWidget({
    Key? key,
    required this.lastChapter,
    required this.color,
  }) : super(key: key);

  final ChapterItem lastChapter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        side: const BorderSide(
          width: 0,
          color: Colors.transparent,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pushNamed(
          ChapterScreen.routeName,
          arguments: ChapterScreen(
            data: context.read<MangaDetailBloc>().params(lastChapter.endpoint!),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
          builder: (context, state) {
            return Center(
              child: Text(
                context.read<MangaDetailBloc>().lastChapter,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
