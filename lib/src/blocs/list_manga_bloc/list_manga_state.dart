import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:irohasu/src/models/manga_list_model.dart';

@immutable
abstract class ListMangaState extends Equatable {
  const ListMangaState();

  @override
  List<Object> get props => [];
}

class InitialListMangaState extends ListMangaState {}

class ListMangaLoadingState extends ListMangaState {}

class ListMangaLoadedState extends ListMangaState {
  ListMangaLoadedState({this.data, this.hasReachedEnd, this.page});

  final List<MangaListModel> data;
  final bool hasReachedEnd;
  int page = 0;

  @override
  String toString() =>
      'data : $data, hasReachedEnd : $hasReachedEnd, page : $page';

  @override
  List<Object> get props => [data];

  ListMangaLoadedState cloneWith({
    List<MangaListModel> data,
    bool hasReachedEnd,
  }) {
    return ListMangaLoadedState(
        data: data ?? this.data,
        hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd);
  }
}

class ListMangaFailureState extends ListMangaState {
  ListMangaFailureState({this.msg});

  final String msg;

  @override
  List<Object> get props => [msg];
}
