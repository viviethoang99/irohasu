part of 'download_bloc.dart';

abstract class DownloadEvent extends Equatable {
  const DownloadEvent();
}

class DownloadChapter extends DownloadEvent {
  DownloadChapter(this.listDownload) : assert(listDownload != null);
  final Map<String, String> listDownload;

  @override
  List<Object> get props => [listDownload];
}
