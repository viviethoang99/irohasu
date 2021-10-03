import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/manga_detail_bloc/bloc.dart';
import '../../../models/chapter_item_model.dart';
import '../../chapter_screens/chapter_screen.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  CustomButtonReadingWidget({
    required this.lastChapter,
  });

  final ChapterItem lastChapter;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.teal,
        onSurface: Colors.red,
        side: BorderSide(
          color: Theme.of(context).buttonColor,
          width: 3,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(25),
          ),
        ),
      ),
      onPressed: () => openChapter(context: context),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: BlocBuilder<MangaDetailBloc, MangaDetailState>(
          builder: (context, state) {
            return Text(
              context.read<MangaDetailBloc>().textLastChapter(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).buttonColor,
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
    BlocProvider.of<MangaDetailBloc>(context).add(
      AddChapterToListReading(lastChapter.endpoint!),
    );
  }
}
