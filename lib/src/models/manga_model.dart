import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

part 'manga_model.g.dart';

@HiveType(typeId: 0)
class MangaModel extends Equatable{
  MangaModel({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.endpoint,
    this.idManga,
  });

  static const mangaBox = 'mangaBox';

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String thumbnailUrl;
  @HiveField(2)
  final String endpoint;
  @HiveField(3)
  final String idManga;

  @override
  List<Object> get props => [title, thumbnailUrl, endpoint];
}