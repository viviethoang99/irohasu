part of 'manga_detail_bloc.dart';

sealed class MangaDetailEvent extends Equatable {
  const MangaDetailEvent();

  @override
  List<Object?> get props => [];
}

final class InitMangaDetailEvent extends MangaDetailEvent {
  const InitMangaDetailEvent(this.mangaDetail);

  final MangaDetail? mangaDetail;

  @override
  List<Object?> get props => [mangaDetail];
}

final class FetchMangaDetailEvent extends MangaDetailEvent {
  const FetchMangaDetailEvent(this.endpoint);

  final String? endpoint;

  @override
  List<Object?> get props => [endpoint];
}

final class AddChapterToListReading extends MangaDetailEvent {
  const AddChapterToListReading(this.idManga);

  final String idManga;

  @override
  List<Object?> get props => [idManga];
}
