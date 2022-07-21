import 'dart:io';
import 'dart:isolate';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:device_info/device_info.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/utils/tool_methods.dart';
import '../../github.dart';

part 'update_app_state.dart';

ReceivePort _port = ReceivePort();

@injectable
class UpdateAppCubit extends Cubit<UpdateAppState> {
  UpdateAppCubit(
    this._latestReleaseUseCase,
    this._getDownloadPathUseCase,
  ) : super(UpdateAppInitial()) {
    init();
  }

  final GetLatestReleaseUseCase _latestReleaseUseCase;
  final GetDownloadPathUseCase _getDownloadPathUseCase;

  Future<void> init() async {
    _bindBackgroundIsolate();
    return _checkVersionApp();
  }

  Future<void> _checkVersionApp() async {
    emit(UpdateAppInitial());
    final packageInfo = await PackageInfo.fromPlatform();
    final currentVersion = packageInfo.version;
    final repository = await _latestReleaseUseCase.call();
    return repository.fold(
      (l) => emit(UpdateAppSuccess()),
      (r) => checkUpdate(currentVersion, r),
    );
  }

  void _bindBackgroundIsolate() {
    final isSuccess = IsolateNameServer.registerPortWithName(
      _port.sendPort,
      'downloader_send_port',
    );
    if (!isSuccess) {
      ToolMethods.unbindBackgroundIsolate();
      _bindBackgroundIsolate();
      return;
    }
    _port.listen((dynamic data) {
      final taskId = (data as List<dynamic>)[0] as String;
      final status = data[1] as DownloadTaskStatus;

      if (status == DownloadTaskStatus.complete) {
        _openDownloadedFile(taskId);
      }
    });
  }

  Future<void> checkUpdate(String currentVersion, ReleaseApp appInfo) async {
    if (currentVersion == appInfo.tagName) {
      emit(UpdateAppSuccess());
      return;
    }
    emit(UpdateAppUndefined(appInfo));
  }

  Future<bool> checkPermission() async {
    if (Platform.isIOS) {
      return true;
    }

    final deviceInfo = DeviceInfoPlugin();
    final androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt <= 28) {
      final status = await Permission.storage.status;
      if (status != PermissionStatus.granted) {
        final result = await Permission.storage.request();
        if (result == PermissionStatus.granted) {
          return true;
        }
      } else {
        return true;
      }
    } else {
      return true;
    }
    return false;
  }

  Future<void> downloadFunction(bool? value) async {
    final checkPer = await checkPermission();
    final currentState = state;
    final userSelect = value ?? false;
    if (currentState is UpdateAppUndefined && userSelect && checkPer) {
      final repository = await _getDownloadPathUseCase.call();
      return repository.fold(
        (error) => null,
        (localPath) => _requestDownload(
          currentState.urlFile,
          localPath,
        ),
      );
    }
  }

  Future<void> _requestDownload(String url, String localPath) async {
    await prepareSaveDir(localPath);
    await FlutterDownloader.enqueue(
      url: url,
      savedDir: localPath,
      saveInPublicStorage: true,
      openFileFromNotification: true,
    );
  }

  Future<bool> _openDownloadedFile(String? taskId) {
    if (taskId != null) {
      return FlutterDownloader.open(taskId: taskId);
    } else {
      return Future.value(false);
    }
  }

  Future<void> prepareSaveDir(String localPath) async {
    final savedDir = Directory(localPath);
    final hasExisted = savedDir.existsSync();
    if (!hasExisted) {
      await savedDir.create();
    }
  }

  @override
  Future<void> close() {
    ToolMethods.unbindBackgroundIsolate();
    _port.close();
    return super.close();
  }
}
