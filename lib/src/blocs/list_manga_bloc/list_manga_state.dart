import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '../../models/manga_list_model.dart';

@immutable
abstract class ListMangaState extends Equatable {
  const ListMangaState();

  @override
  List<Object?> get props => [];
}

class InitialListMangaState extends ListMangaState {}

class ListMangaLoadingState extends ListMangaState {}

class ListMangaLoadedState extends ListMangaState {
  ListMangaLoadedState({this.data, this.hasReachedEnd, this.page = 0});

  final List<MangaModel>? data;
  final bool? hasReachedEnd;
  final int page;

  ListMangaLoadedState cloneWith(
      {List<MangaModel>? data, bool? hasReachedEnd, int? page}) {
    return ListMangaLoadedState(
      data: data ?? this.data,
      hasReachedEnd: hasReachedEnd ?? this.hasReachedEnd,
      page: page ?? this.page,
    );
  }

  @override
  List<Object?> get props => [data, hasReachedEnd, page];
}

class ListMangaFailureState extends ListMangaState {
  ListMangaFailureState({this.msg});

  final String? msg;

  @override
  List<Object?> get props => [msg];
}
