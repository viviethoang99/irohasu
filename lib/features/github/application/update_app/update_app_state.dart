part of 'update_app_cubit.dart';

abstract class UpdateAppState extends Equatable {
  const UpdateAppState();

  @override
  List<Object> get props => [];
}

class UpdateAppInitial extends UpdateAppState {}

class UpdateAppUndefined extends UpdateAppState {
  const UpdateAppUndefined(this.appInfo);

  final ReleaseApp appInfo;

  String get urlFile => appInfo.assets.first.browserDownloadUrl;

  @override
  List<Object> get props => [appInfo];
}

class UpdateAppSuccess extends UpdateAppState {}

class UpdateAppFailed extends UpdateAppState {}
