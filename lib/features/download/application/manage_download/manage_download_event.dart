part of 'manage_download_bloc.dart';

abstract class ManageDownloadEvent extends Equatable {
  const ManageDownloadEvent();

  @override
  List<Object> get props => [];
}

class AddChapterEvent extends ManageDownloadEvent {
  const AddChapterEvent(this.endpoint);

  final String endpoint;

  @override
  List<Object> get props => [endpoint];
}

class AddMangaEvent extends ManageDownloadEvent {
  const AddMangaEvent(this.listEndpoint);

  final List<String> listEndpoint;

  @override
  List<Object> get props => [listEndpoint];
}

class DeleteMangaEvent extends ManageDownloadEvent {
  const DeleteMangaEvent(this.idManga);

  final String idManga;

  @override
  List<Object> get props => [idManga];
}

class DeleteChapterEvent extends ManageDownloadEvent {
  const DeleteChapterEvent(this.idChapter);
  
  final String idChapter;

  @override
  List<Object> get props => [idChapter];
}

class DownloadChapterEvent extends ManageDownloadEvent {
  const DownloadChapterEvent(this.endpoint);

  final String endpoint;

  @override
  List<Object> get props => [endpoint];
}
