import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:irohasu/src/blocs/manga_detail_bloc/bloc.dart';
import 'package:irohasu/src/service/history_data.dart';
import '../../../screens/chapter_screens/chapter_screen.dart';

class CustomButtonReadingWidget extends StatelessWidget {
  CustomButtonReadingWidget({
    @required this.status,
    @required this.color,
    @required this.chapterList,
    @required this.idManga
  });

  final String status;
  final Object color;
  final List chapterList;
  final String idManga;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      //Makes it usable on any background color
      child: Ink(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).buttonColor, width: 3),
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: InkWell(
          onTap: () {
            HistoryData.addChapToHistory(
              idManga: idManga,
              idChapter: chapterList.last.idChapter,
            );
            BlocProvider.of<MangaDetailBloc>(context)
                .add(AddChapterToListReading(idManga));
            Navigator.of(context).pushNamed(
              ChapterScreen.routeName,
              arguments: ChapterScreen(
                endpoint: chapterList.last.chapterEndpoint.toString(),
                chapterList: chapterList,
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            alignment: Alignment.center,
            child: Text(
              status.toUpperCase(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Theme.of(context).buttonColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
