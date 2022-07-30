part of 'manage_download_bloc.dart';

abstract class ManageDownloadState extends Equatable {
  const ManageDownloadState();
  
  @override
  List<Object> get props => [];
}

class ManageDownloadInitial extends ManageDownloadState {}
