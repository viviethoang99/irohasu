import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchModel{
  SearchModel({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.setUrlWithoutDomain,
    // @required this.view,
    // @required this.comment,
    // @required this.totalChapter,
  });

  final String title;
  final String thumbnailUrl;
  final String setUrlWithoutDomain;
  // final int totalChapter;
  // final int view;
  // final int comment;
}