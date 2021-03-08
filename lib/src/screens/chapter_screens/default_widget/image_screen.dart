import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:irohasu/env.dart';
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
          return CachedNetworkImage(
            imageUrl: data.listImageChapter[index].chapterImageLink,
            httpHeaders: ENV.headersBuilder,
          );
        },
        itemCount: data.listImageChapter.length,
      ),
    );
  }
}