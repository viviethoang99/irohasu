import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

import '../../models/chapter_model.dart';
import '../../resources/chapter_repo.dart';

part 'download_event.dart';
part 'download_state.dart';

class DownloadBloc extends Bloc<DownloadEvent, DownloadState> {
  DownloadBloc() : super(DownloadInitialState());
  ChapterRepo _chapterRepo;

  @override
  Stream<DownloadState> mapEventToState(DownloadEvent event) async* {
    if(event is DownloadChapter) {
      yield DownloadLoadingState();
    }
  }

  Future<String> downloadFile(
      String uri, String name, String folderName, Function onProgress) async {
    final dio = Dio();
    var token = CancelToken();

    try {
      var _appDocDirFolder = await createFolder(folderName);

      if (_appDocDirFolder != null) {
        _appDocDirFolder = '$_appDocDirFolder/$name';
        final res = await http.get(uri);
        if (res.statusCode == 200) {
          await dio.download(uri, _appDocDirFolder, cancelToken: token);
          return _appDocDirFolder;
        } else {
          return null;
        }
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> createFolder(String name) async {
    try {
      //Get this App Document Directory
      final _appDocDir = await getApplicationDocumentsDirectory();

      //App Document Directory + folder name
      final _appDocDirFolder = Directory('${_appDocDir.absolute.path}/$name');

      if (await _appDocDirFolder.exists()) {
        // if folder already exists return path
        return _appDocDirFolder.path;
      } else {
        // if folder not exists create folder and then return its path
        final _appDirNewFolder = await _appDocDirFolder.create(recursive: true);
        return _appDirNewFolder.path;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
