import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DownloadData {
  Future<String?> createFolder(String? name,
      {String folder = 'download'}) async {
    try {
      //Get this App Document Directory
      final _appDocDir = await getApplicationDocumentsDirectory();

      //App Document Directory + folder save + folder name
      final _appDocDirFolder = Directory(
        (name == null)
            ? '${_appDocDir.absolute.path}/$folder'
            : '${_appDocDir.absolute.path}/$folder/$name',
      );

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

  Future<bool> removeFolder({required String url}) async {
    //Get this App Document Directory
    final _appDocDir = await getApplicationDocumentsDirectory();
    //App Document Directory + folder name
    final _appDocDirFolder = Directory(_appDocDir.absolute.path + url);
    if (await _appDocDirFolder.exists()) {
      _appDocDirFolder.deleteSync(recursive: true);
      return true;
    }
    return false;
  }

  Future<String?> downloadChapter({
    String? uri,
    String? name,
    String? folderName,
    Function? onProgress,
  }) async {
    // final dio = Dio();

    try {
      // var appDocDirFolder = await createFolder('$folderName/$name');
      // if (appDocDirFolder != null) {
      //   final data = await ChapterRepo().getDataChapter(uri!);
      //   for (var item in data.listImage!) {
      //     var fileName = nameFile(item.chapterImageLink!, item.number);
      //     // Name file
      //     var _appDocDirImage = '$appDocDirFolder/$fileName';
      //     await dio.download(item.chapterImageLink!, _appDocDirImage,
      //         options: Options(headers: {
      //           HttpHeaders.refererHeader: ENV.webPage,
      //         }));
      //     onProgress!(item.number! / data.listImage!.length);
      //   }
      //   return appDocDirFolder;
      // } else {
      //   return null;
      // }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String> relativePathChapter({required String uri}) async {
    final _appDocDir = await getApplicationDocumentsDirectory();
    uri = uri.replaceAll(_appDocDir.absolute.path, '').trim();
    return uri;
  }

  // Return endpoint URl
  String nameFolder(String name) => name.substring(name.lastIndexOf('/') + 1);

  String nameFile(String name, int? index) => "$index.${name.split('.').last}";
}
