import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';

abstract class IDownloadLocalSource {
  Future<List<String>> getPathsImageChapter(List<String> tasks);

  Future<int> getProgress(List<String> tasks);

  Future<bool> deleteImageChapter(List<String> paths);
}

@Injectable(as: IDownloadLocalSource)
class DownloadLocalSourceImpl implements IDownloadLocalSource {
  @override
  Future<List<String>> getPathsImageChapter(List<String> tasks) async {
    var paths = <String>[];
    for (var item in tasks) {
      final task = await FlutterDownloader.loadTasksWithRawQuery(
          query: 'SELECT * FROM task WHERE task_id="$item"');
      if (task?.isNotEmpty ?? false) {
        paths.add('${task![0].savedDir}/${task[0].filename}');
      }
    }
    return paths;
  }

  @override
  Future<int> getProgress(List<String> tasks) async {
    var progress = 0;
    for (var item in tasks) {
      final task = await FlutterDownloader.loadTasksWithRawQuery(
          query: 'SELECT * FROM task WHERE task_id="$item"');
      if (task?.isNotEmpty ?? false) {
        progress += task![0].progress;
      }
    }
    return progress;
  }

  @override
  Future<bool> deleteImageChapter(List<String> paths) async {
    try {
      for (var path in paths) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }
      return true;
    } catch (_) {
      return false;
    }
  }
}
