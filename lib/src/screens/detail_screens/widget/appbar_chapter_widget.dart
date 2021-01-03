import 'package:flutter/material.dart';
import '../../../models/manga_detail_model.dart';

class AppbarChapterWidget extends StatelessWidget {
  const AppbarChapterWidget({
    Key key,
    @required this.data,
  }) : super(key: key);

  final MangaDetail data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            '${data.chapter.length} Chapters',
            style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          const Icon(
            Icons.text_rotate_vertical,
            color: Colors.green,
            size: 26,
          ),
        ],
      ),
    );
  }
}