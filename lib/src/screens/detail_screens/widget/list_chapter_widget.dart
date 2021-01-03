import 'package:flutter/material.dart';
import '../../../models/manga_detail_model.dart';
import '../../chapter_screens/chapter_screen.dart';

class ListChapterWidget extends StatelessWidget {
  const ListChapterWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final MangaDetail data;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      removeTop: true,
      context: context,
      child: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
          const Divider(
            color: Colors.white54,
          ),
          shrinkWrap: true,
          itemCount: data.chapter.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              dense: true,
              title: Text(
                data.chapter[index].chapterTitle.toString(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                data.chapter[index].chapterUpload.toString(),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 18,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_circle_down,
                color: Colors.green,
                size: 30,
              ),
              isThreeLine: true,
              onTap: () {
                Navigator.of(context).pushNamed(
                  ChapterScreen.routeName,
                  arguments: ChapterScreen(
                    endpoint:
                    data.chapter[index].chapterEndpoint.toString(),
                    chapterList: data.chapter,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}