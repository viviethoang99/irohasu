import 'package:equatable/equatable.dart';

import '../../../src/models/list_manga_model.dart';

abstract class ListMangaState extends Equatable {
  const ListMangaState();
  @override
  List<Object> get props => [];
}

class InitialListMangaState extends ListMangaState {}

class ListMangaLoadingState extends ListMangaState{}

class ListMangaLoadedState extends ListMangaState{
  final List<ListManga> data;

  const ListMangaLoadedState({this.data});

  @override
  String toString() => "data : $data";

  @override
  List<Object> get props => [data];

  ListMangaLoadedState cloneWith({
    List<ListManga> comments,
    bool hasReachedEnd}) {
    return ListMangaLoadedState(
        data: comments ?? this.data,
    );
  }
}

class ListMangaFailureState extends ListMangaState{
  final String msg;

  ListMangaFailureState({this.msg});

  @override
  List<Object> get props => [msg];
}