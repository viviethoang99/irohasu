import 'package:equatable/equatable.dart';

import '../../../src/models/manga_detail_model.dart';

abstract class MangaDetailState extends Equatable {
  const MangaDetailState();
  @override
  List<Object> get props => [];
}

class InitialMangaDetailState extends MangaDetailState{}

class MangaDetailLoadingState extends MangaDetailState{}

class MangaDetailLoadedState extends MangaDetailState{
  const MangaDetailLoadedState({this.data});
  final MangaDetail data;

  @override
  List<Object> get props => [data];
}

class MangaDetailFailureState extends MangaDetailState{
  MangaDetailFailureState({this.msg});
  final String msg;

  @override
  List<Object> get props => [msg];
}