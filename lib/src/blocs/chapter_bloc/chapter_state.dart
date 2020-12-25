import 'package:equatable/equatable.dart';

import '../../../src/models/chapter_model.dart';

abstract class ChapterState extends Equatable{
  const ChapterState();

  @override
  List<Object> get props => [];
}

class InitialChapterState extends ChapterState {}

class ChapterLoadingState extends ChapterState{}

class ChapterLoadedState extends ChapterState{
  final ChapterModel data;
  const ChapterLoadedState({this.data});

  @override
  List<Object> get props => [data];
}

class ChapterFailureState extends ChapterState{
  final String msg;

  ChapterFailureState({this.msg});

  @override
  List<Object> get props => [msg];
}