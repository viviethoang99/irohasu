import 'package:flutter/cupertino.dart';
import 'package:equatable/equatable.dart';

class ChapterModel {
  ChapterModel({
    this.idChapter,
    this.titleChapter,
    this.chapterEndpoint,
    this.listImageChapter,
    this.mangaDetail,
    this.titleManga,
    this.totalImage,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    idChapter: json['idChapter'] as String,
        titleManga: json['titleManga'] as String,
        titleChapter: json['titleChapter'] as String,
        mangaDetail: json['mangaDetail'] as String,
        chapterEndpoint: json['chapterEndpoint'] as String,
        listImageChapter: List<ChapterImage>.from(
          json['chapterImage'].map(
              (json) =>
                  ChapterImage.fromJson(json)),
        ),
        totalImage: json['totalImage'] as int,
      );

  String idChapter;
  String titleChapter;
  String chapterEndpoint;
  String mangaDetail;
  String titleManga;
  int totalImage;
  List<ChapterImage> listImageChapter;
}

class ChapterImage extends Equatable {
  ChapterImage({@required this.chapterImageLink, @required this.number});

  factory ChapterImage.fromJson(Map<String, dynamic> json) => ChapterImage(
      number: json['imageNumber'],
      chapterImageLink: json['imageLink']);

  final String chapterImageLink;
  final int number;

  @override
  List<Object> get props => [chapterImageLink, number];
}
