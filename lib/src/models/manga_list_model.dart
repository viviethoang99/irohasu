import 'package:equatable/equatable.dart';

class MangaListModel extends Equatable {
  MangaListModel({
    this.idManga,
    this.title,
    this.thumbnailUrl,
    this.endpoint,
  });

  factory MangaListModel.fromMap(Map<String, dynamic> json) {
    return MangaListModel(
        idManga: json['idManga'] as String,
        title: json['title'] as String,
        thumbnailUrl: json['thumb'] as String,
        endpoint: json['endpoint'] as String);
  }

  final String idManga;
  final String title;
  final String thumbnailUrl;
  final String endpoint;

  @override
  List<Object> get props => [title, title, thumbnailUrl, endpoint];
}
