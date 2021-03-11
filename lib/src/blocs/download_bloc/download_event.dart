part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadChapterEvent extends DownloadEvent {
  DownloadChapterEvent({this.chapterModel, this.titleManga, this.idManga})
      : assert(chapterModel != null, idManga != null);
  final String titleManga;
  final String idManga;
  final ChapterItem chapterModel;

  @override
  List<Object> get props => [chapterModel, idManga];
}

class CancelDownloadEvent extends DownloadEvent {
  CancelDownloadEvent({this.idChapter}) : assert(idChapter != null);

  final String idChapter;

  @override
  List<Object> get props => [idChapter];
}

class ChapterDownloadPercentageChangedEvent extends DownloadEvent {
  ChapterDownloadPercentageChangedEvent({
    this.idManga,
    this.idChapter,
    this.percentage,
  });

  final double percentage;
  final String idManga;
  final String idChapter;

  @override
  List<Object> get props => [percentage];

  ChapterDownloadPercentageChangedEvent copyWith({
    double percentage,
    String idManga,
    String idChapter,
  }) {
    return ChapterDownloadPercentageChangedEvent(
      percentage: percentage ?? this.percentage,
      idManga: idManga ?? this.idManga,
      idChapter: idChapter ?? this.idChapter,
    );
  }
}

class RemoveDownloadChapterEvent extends DownloadEvent {
  RemoveDownloadChapterEvent({this.idManga, this.chapter});

  final ChapterItem chapter;
  final String idManga;

  @override
  List<Object> get props => throw UnimplementedError();
}
