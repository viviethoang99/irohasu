part of 'download_chap_cubit.dart';

abstract class DownloadChapState extends Equatable {
  const DownloadChapState();

  @override
  List<Object?> get props => [];
}

class DownloadChapInitial extends DownloadChapState {}

class DownloadingState extends DownloadChapState {
  const DownloadingState(this.chapter);

  final DownloadChapter? chapter;

  @override
  List<Object?> get props => [chapter];
}

class DownloadSuccessState extends DownloadChapState {}

class DownloadFailureState extends DownloadChapState {}
