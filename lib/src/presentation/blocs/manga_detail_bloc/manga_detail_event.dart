part of 'manga_detail_bloc.dart';

abstract class MangaDetailEvent extends Equatable {
  const MangaDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchMangaDetailEvent extends MangaDetailEvent {}

class AddChapterToListReading extends MangaDetailEvent {
  const AddChapterToListReading(this.idManga);

  final String idManga;
}
