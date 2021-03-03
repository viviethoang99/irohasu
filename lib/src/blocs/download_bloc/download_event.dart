part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadChapterEvent extends DownloadEvent {
  DownloadChapterEvent({this.chapterModel, this.titleManga, this.indexManga})
      : assert(chapterModel != null, indexManga != null);
  final String titleManga;
  final int indexManga;
  final ChapterItem chapterModel;

  @override
  List<Object> get props => [chapterModel, indexManga];
}

class CancelDownloadEvent extends DownloadEvent {
  CancelDownloadEvent({this.idChapter}) : assert(idChapter != null);

  final String idChapter;

  @override
  List<Object> get props => [idChapter];
}

class ChapterDownloadPercentageChangedEvent extends DownloadEvent {
  ChapterDownloadPercentageChangedEvent({
    this.indexManga,
    this.idChapter,
    this.percentage,
  });

  final double percentage;
  final int indexManga;
  final String idChapter;

  @override
  List<Object> get props => [percentage];

  ChapterDownloadPercentageChangedEvent copyWith({
    double percentage,
    int indexManga,
    String idChapter,
  }) {
    return ChapterDownloadPercentageChangedEvent(
      percentage: percentage ?? this.percentage,
      indexManga: indexManga ?? this.indexManga,
      idChapter: idChapter ?? this.idChapter,
    );
  }
}

class RemoveChapterEvent extends DownloadEvent {
  RemoveChapterEvent({this.indexManga, this.chapter});

  final ChapterItem chapter;
  final int indexManga;

  @override
  List<Object> get props => throw UnimplementedError();
}
