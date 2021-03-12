import 'package:equatable/equatable.dart';

abstract class MangaDetailEvent extends Equatable {
  const MangaDetailEvent();
  @override
  List<Object> get props => [];
}

class FetchMangaDetailEvent extends MangaDetailEvent{
  FetchMangaDetailEvent(this.endpoint);
  final String endpoint;
}

class AddChapterToListReading extends MangaDetailEvent {
  AddChapterToListReading(this.idManga);

  final String idManga;
}