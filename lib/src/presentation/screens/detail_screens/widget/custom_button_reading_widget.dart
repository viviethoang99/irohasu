import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/model/chapter_item_model.dart';
import '../../../blocs/manga_detail_bloc/manga_detail_bloc.dart';
import '../../chapter_screens/chapter_screen.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  const CustomButtonReadingWidget({
    required this.lastChapter,
    required this.color,
  });

  final ChapterItem lastChapter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: color,
        primary: Colors.teal,
        onSurface: Colors.red,
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
      onPressed: () => openChapter(context: context),
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

  void openChapter({required BuildContext context}) {
    Navigator.of(context).pushNamed(
      ChapterScreen.routeName,
      arguments: ChapterScreen(endpoint: lastChapter.endpoint),
    );
  }
}
