part of 'download_bloc.dart';

abstract class DownloadState extends Equatable {
  const DownloadState();

  @override
  List<Object?> get props => [];
}

class DownloadInitialState extends DownloadState {}

class DownloadingState extends DownloadState {}

class DownloadProcessState extends DownloadState {
  const DownloadProcessState({this.downloadPercentageCompleted = 0});

  final double downloadPercentageCompleted;

  @override
  List<Object> get props => [downloadPercentageCompleted];

  @override
  String toString() {
    return '${downloadPercentageCompleted.toStringAsFixed(2)} %';
  }

  DownloadProcessState copyWith({double? downloadPercentageCompleted}) {
    return DownloadProcessState(
      downloadPercentageCompleted:
          downloadPercentageCompleted ?? this.downloadPercentageCompleted,
    );
  }
}

class DownloadedState extends DownloadState {
  const DownloadedState({this.data});

  final String? data;

  @override
  List<Object?> get props => [data];
}

class DownloadFailureState extends DownloadState {
  const DownloadFailureState({this.msg});
  final String? msg;

  @override
  List<Object?> get props => [msg];
}
