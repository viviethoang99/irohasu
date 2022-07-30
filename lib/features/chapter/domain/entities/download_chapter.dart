import 'dart:io';

import 'package:flutter_downloader/flutter_downloader.dart';

import '../../chapter.dart';

class DownloadChapter {
  const DownloadChapter({
    required this.title,
    required this.idManga,
    required this.idChapter,
    required this.tasks,
  });

  final String title;
  final String idManga;
  final String idChapter;
  final List<String> tasks;

  DownloadChapterDto toDto() {
    return DownloadChapterDto(
      title: title,
      idChapter: idChapter,
      idManga: idManga,
      tasks: tasks
    );
  }

  int get total => tasks.isEmpty ? 100 : tasks.length * 100;

  Future<List<String>> get paths async {
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

  Future<int> get progress async {
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

  Future<void> delete() async {
    try {
      for (var path in await paths) {
        final file = File(path);
        if (await file.exists()) {
          await file.delete();
        }
      }
    } catch (_) {}
  }
}
