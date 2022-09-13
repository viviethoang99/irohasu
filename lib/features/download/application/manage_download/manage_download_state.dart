part of 'manage_download_bloc.dart';

class ManageDownloadState extends Equatable {
  const ManageDownloadState({
    this.chapterDownload = const [],
    this.chapterWait = const [],
  });

  final List<String> chapterWait;
  final List<String> chapterDownload;

  ManageDownloadState removeChapterWaitByEndpoint(String endpoint) {
    final list = chapterWait.where((element) => endpoint != element).toList();
    return copyWith(chapterWait: list);
  }

  ManageDownloadState removeChapterDownloadByEndpoint(String endpoint) {
    var list = chapterDownload.where((element) {
      return toId(endpoint) != toId(element);
    }).toList();
    return copyWith(chapterDownload: list);
  }

  ManageDownloadState addToAwaitDownload(String endpoint) {
    return copyWith(chapterWait: [...chapterWait, endpoint]);
  }

  String toId(String endpoint) => endpoint.split('/')[1];

  ManageDownloadState copyWith({
    List<String>? chapterWait,
    List<String>? chapterDownload,
  }) {
    return ManageDownloadState(
      chapterDownload: chapterDownload ?? this.chapterDownload,
      chapterWait: chapterWait ?? this.chapterWait,
    );
  }

  @override
  List<Object> get props => [chapterDownload, chapterWait];
}

extension ManageDownloadStateX on ManageDownloadState {}
