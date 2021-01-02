import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class MangaDetail {
  MangaDetail({
    @required this.title,
    @required this.thumb,
    @required this.status,
    @required this.author,
    // @required this.updatedOn,
    @required this.description,
    @required this.dislike,
    @required this.like,
    @required this.endpoint,
    // @required this.theme,
    @required this.chapter,
  });

  final String title,
      thumb,
      status,
      // updatedOn,
      description,
      dislike,
      like,
      endpoint;
  final List author, chapter;
}

class ChapterList extends Equatable {
  ChapterList({
    @required this.chapterTitle,
    @required this.chapterEndpoint,
    @required this.chapterUpload,
  });

  final String chapterTitle;
  final String chapterEndpoint;
  final String chapterUpload;

  @override
  List<Object> get props => [chapterTitle, chapterEndpoint, chapterUpload];
}
