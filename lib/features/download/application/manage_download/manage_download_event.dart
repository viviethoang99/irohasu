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

class AddMangaEvent extends ManageDownloadEvent {}

class DeleteMangaEvent extends ManageDownloadEvent {}

class DeleteChapterEvent extends ManageDownloadEvent {}

class DownloadChapterEvent extends ManageDownloadEvent {
  const DownloadChapterEvent(this.endpoint);
  
  final String endpoint;

  @override
  List<Object> get props => [endpoint];
}
