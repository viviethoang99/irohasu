import 'dart:convert';
import 'dart:io';

import 'package:archive/archive_io.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class Download {
  static CancelToken token = CancelToken();

  static Future<String> createFolder(String name) async {
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

  static Future<dynamic> downloadManga(
      {@required String uri, @required String folder}) async {
    print('Function $uri');
    var fileName = uri.substring(uri.lastIndexOf('/') + 1);
    var path = await downloadFile(
        uri, fileName, folder, (dynamic rec, dynamic total) {});

    if (path != null) {
      List<int> bytes = File(path).readAsBytesSync();
      var string = utf8.decode(GZipDecoder().decodeBytes(bytes));
      return jsonDecode(string);
    }
    return null;
  }

  static Future<String> downloadFile(
      String uri, String name, String folderName, Function onProgress) async {
    final dio = Dio();
    token = CancelToken();

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

  static Future<String> downloadImage(
      {@required String uri,
      @required String folder,
      @required String chapter}) async {
    var fileName = chapter + uri.substring(uri.lastIndexOf('/') + 1);
    var path = await downloadFile(
        uri, fileName, folder, (dynamic rec, dynamic total) {});

    if (path != null) {
      return path;
    }
    return null;
  }
}
