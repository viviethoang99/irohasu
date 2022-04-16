part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadChapterEvent extends DownloadEvent {
  const DownloadChapterEvent({
    required this.chapterModel,
    this.titleManga,
    this.idManga,
  });

  final String? titleManga;
  final String? idManga;
  final ChapterItem chapterModel;

  @override
  List<Object?> get props => [chapterModel, idManga];
}

class CancelDownloadEvent extends DownloadEvent {
  const CancelDownloadEvent({required this.idChapter});

  final String idChapter;

  @override
  List<Object> get props => [idChapter];
}

class ChapterDownloadPercentageChangedEvent extends DownloadEvent {
  const ChapterDownloadPercentageChangedEvent({
    this.idManga,
    this.idChapter,
    this.percentage,
  });

  final double? percentage;
  final String? idManga;
  final String? idChapter;

  @override
  List<Object?> get props => [percentage];

  ChapterDownloadPercentageChangedEvent copyWith({
    double? percentage,
    String? idManga,
    String? idChapter,
  }) {
    return ChapterDownloadPercentageChangedEvent(
      percentage: percentage ?? this.percentage,
      idManga: idManga ?? this.idManga,
      idChapter: idChapter ?? this.idChapter,
    );
  }
}

class RemoveDownloadChapterEvent extends DownloadEvent {
  const RemoveDownloadChapterEvent({this.idManga, this.chapter});

  final ChapterItem? chapter;
  final String? idManga;

  @override
  List<Object?> get props => [chapter, idManga];
}
