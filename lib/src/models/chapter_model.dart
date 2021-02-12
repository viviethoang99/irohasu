import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

class ChapterModel {
  ChapterModel(
      {this.titleChapter,
      this.chapterEndpoint,
      this.listImageChapter,
      this.mangaDetail,
      this.titleManga});

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        titleManga: json['titleManga'] as String,
        titleChapter: json['title'] as String,
        mangaDetail: json['mangaDetail'] as String,
        chapterEndpoint: json['chapter_endpoint'] as String,
        listImageChapter: List<ChapterImage>.from(
          (json['chapter_image'] as List<dynamic>).map<ChapterImage>(
              (dynamic json) =>
                  ChapterImage.fromJson(json as Map<String, dynamic>)),
        ),
      );

  String titleChapter;
  String chapterEndpoint;
  String mangaDetail;
  String titleManga;
  List<ChapterImage> listImageChapter;
}

class ChapterImage extends Equatable {
  ChapterImage({@required this.chapterImageLink, @required this.number});

  factory ChapterImage.fromJson(Map<String, dynamic> json) => ChapterImage(
      number: json['imageNumber'] as int,
      chapterImageLink: json['imageLink'] as String);

  final String chapterImageLink;
  final int number;

  @override
  List<Object> get props => [chapterImageLink, number];
}
