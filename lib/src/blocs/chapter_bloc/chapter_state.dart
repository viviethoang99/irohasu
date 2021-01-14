import 'package:equatable/equatable.dart';

import '../../../src/models/chapter_model.dart';
import './bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();

  @override
  List<Object> get props => [];
}

class InitialChapterState extends ChapterState {}

class ChapterLoadingState extends ChapterState {}

class ChapterLoadedState extends ChapterState {
  const ChapterLoadedState(
      {this.data, this.readingMode = ReadingMode.vertical});

  final ChapterModel data;
  final ReadingMode readingMode;

  ChapterLoadedState copyWith({ReadingMode readingMode, ChapterModel data}) {
    return ChapterLoadedState(
        readingMode: readingMode ?? this.readingMode, data: data ?? this.data);
  }

  @override
  List<Object> get props => [data, readingMode];
}

class ChapterFailureState extends ChapterState {
  ChapterFailureState({this.msg});

  final String msg;

  @override
  List<Object> get props => [msg];
}