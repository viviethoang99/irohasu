import 'package:flutter/material.dart';
import '../../../constants/base_blogtruyen.dart';
import '../../../models/chapter_model.dart';

class LoadImage extends StatelessWidget {
  const LoadImage({
    Key key,
    @required ScrollController scrollController,
    @required this.data,
  }) : _scrollController = scrollController, super(key: key);

  final ScrollController _scrollController;
  final ChapterModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 56),
        physics: const ClampingScrollPhysics(),
        controller: _scrollController,
        itemBuilder: (context, index) {
          return Image.network(
            data.listImageChapter[index].chapterImageLink,
            headers: BlogTruyen.headersBuilder,
          );
        },
        itemCount: data.listImageChapter.length,
      ),
    );
  }
}