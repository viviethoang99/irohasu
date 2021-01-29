import 'package:equatable/equatable.dart';
import 'package:irohasu/src/models/chapter_model.dart';
import 'package:irohasu/src/models/manga_model.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class InitialChapterState extends ChapterState {}

class ChapterLoadingState extends ChapterState {}

class ChapterLoadedState extends ChapterState {
  const ChapterLoadedState({this.data});

  final ChapterModel data;

  @override
  List<Object> get props => [data];
}

class ChapterFailureState extends ChapterState {
  ChapterFailureState({this.msg});

  final String msg;

  @override
  List<Object> get props => [msg];
}
