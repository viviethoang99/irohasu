part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object> get props => [];
}

class DownloadInitialState extends DownloadState {}
class DownloadLoadingState extends DownloadState {}

class DownloadLoadedState extends DownloadState {
  const DownloadLoadedState({this.data});

  final ChapterModel data;

  @override
  List<Object> get props => [data];
}
class DownloadFailureState extends DownloadState {}
