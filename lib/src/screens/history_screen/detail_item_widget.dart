import 'package:flutter/material.dart';
import 'package:irohasu/src/screens/detail_screens/manga_detail_screen.dart';

import '../../helper/chap_helper.dart';
import '../../helper/convert_date_time.dart';
import '../../models/chapter_item_model.dart';

class DetailItemWidget extends StatelessWidget {
  const DetailItemWidget({
    Key key,
    @required this.item,
    @required this.titleManga,
    @required this.timeCreate,
    @required this.urlManga,
  }) : super(key: key);

  final ChapterItem item;
  final String titleManga;
  final DateTime timeCreate;
  final String urlManga;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 150,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              /*
                  1, Title Chapter;
                  2, Title Manga
                  3, Last reading
               */
              Text(
                ChapHelper.removeNameManga(
                  titleChapter: item.chapterTitle,
                  nameManga: titleManga,
                ),
                style: TextStyle(
                  fontSize: 23,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                titleManga,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 4),
              Text(
                ConvertDateTime.checkLastRead(timeCreate),
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.white70,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              const SizedBox(height: 6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                    child: const Text(
                      'Xoá',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text(
                      'Xem chi tiết',
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(
                        MangaDetailScreen.routeName,
                        arguments: urlManga,
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
