import 'package:flutter/cupertino.dart';

class ListManga {
  final String title;
  final String thumbnailUrl;
  final String setUrlWithoutDomain;

  ListManga({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.setUrlWithoutDomain,
  });

// factory DetailMangaModel.fromJson(Map<String, String> json) {
//   return DetailMangaModel(
//     title: json['title'],
//     thumbnailUrl: json['thumbnailUrl'],
//     setUrlWithoutDomain: json['setUrlWithoutDomain'],
//   );
// }
}