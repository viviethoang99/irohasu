import 'package:flutter/cupertino.dart';

class ListManga {
  ListManga({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.setUrlWithoutDomain,
  });

  final String title;
  final String thumbnailUrl;
  final String setUrlWithoutDomain;
}