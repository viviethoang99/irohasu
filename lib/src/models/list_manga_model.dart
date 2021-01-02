import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class ListManga extends Equatable{
  ListManga({
    @required this.title,
    @required this.thumbnailUrl,
    @required this.setUrlWithoutDomain,
  });

  final String title;
  final String thumbnailUrl;
  final String setUrlWithoutDomain;

  @override
  List<Object> get props => [title, thumbnailUrl, setUrlWithoutDomain];
}