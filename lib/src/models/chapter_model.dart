import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

class ChapterModel {
  ChapterModel(
      {this.title,
        this.chapterEndpoint,
        this.listImageChapter,
        this.mangaDetail});

  String title, chapterEndpoint, mangaDetail;
  List<ChapterImage> listImageChapter;
}

class ChapterImage extends Equatable {
  ChapterImage({@required this.chapterImageLink, @required this.number});

  final String chapterImageLink;
  final int number;

  @override
  List<Object> get props => [chapterImageLink, number];
}