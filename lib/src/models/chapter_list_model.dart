import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part  'chapter_list_model.g.dart';

@HiveType(typeId: 2)
class ChapterList extends Equatable {
  ChapterList({
    @required this.chapterTitle,
    @required this.chapterEndpoint,
    @required this.chapterUpload,
    this.progress = 0,
  });

  @HiveField(0)
  final String chapterTitle;
  @HiveField(1)
  final String chapterEndpoint;
  @HiveField(2)
  final DateTime chapterUpload;
  @HiveField(3)
  int progress;

  @override
  List<Object> get props => [chapterTitle, chapterEndpoint, chapterUpload];
}