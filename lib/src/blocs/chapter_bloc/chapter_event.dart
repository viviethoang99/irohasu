import 'package:equatable/equatable.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class FetchDataChapterEvent extends ChapterEvent {
  FetchDataChapterEvent({this.endpoint});

  final String endpoint;
}

