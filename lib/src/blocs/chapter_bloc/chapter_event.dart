import 'package:equatable/equatable.dart';

import '../../models/chapter_item_model.dart';

abstract class ChapterEvent extends Equatable {
  const ChapterEvent();

  @override
  List<Object> get props => [];
}

class FetchDataChapterEvent extends ChapterEvent {
  FetchDataChapterEvent({this.endpoint});

  final String? endpoint;
}

class FetchDataDownloadEvent extends ChapterEvent {
  const FetchDataDownloadEvent({
    this.item,
    this.titleManga,
    this.mangaDetail,
  });

  final ChapterItem? item;
  final String? mangaDetail;
  final String? titleManga;
}
