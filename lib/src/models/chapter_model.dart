import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

class ChapterModel {
  String title, chapterEndpoint;
  List<ChapterImage> listImageChapter;

  ChapterModel({this.title, this.chapterEndpoint, this.listImageChapter});
}

class ChapterImage extends Equatable {
  final String chapterImageLink;
  final int number;

  ChapterImage({
    @required this.chapterImageLink,
    @required this.number});

  @override
  List<Object> get props => [chapterImageLink, number];
}
