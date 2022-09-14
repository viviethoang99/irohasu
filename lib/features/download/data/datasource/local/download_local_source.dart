import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../../../../chapter/chapter.dart';

abstract class IDownloadLocalSource {
  Future<List<String>> getPathsImageChapter(List<String> tasks);

  Future<int> getProgress(List<String> tasks);

  Future<bool> deleteImageChapter(List<String> paths);

  Stream<List<String>> watchListChapterDownload(String idManga);

  List<String> findAllChapterDownload(String idManga);

  Future<ChapterDto?> deleteChapter(String idChapter);
}

@Injectable(as: IDownloadLocalSource)
class DownloadLocalSourceImpl implements IDownloadLocalSource {
  const DownloadLocalSourceImpl(
    @Named('download_chapter_box') this._box,
  );

  final Box<ChapterDto> _box;

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
      for (var taskId in paths) {
        await FlutterDownloader.remove(
          taskId: taskId,
          shouldDeleteContent: true,
        );
      }
      return true;
    } catch (_) {
      return false;
    }
  }

  @override
  Stream<List<String>> watchListChapterDownload(String idManga) {
    return _box.watch().map((_) => findAllChapterDownload(idManga));
  }

  @override
  List<String> findAllChapterDownload(String idManga) {
    return _box.values
        .where((chapter) => chapter.idManga == idManga)
        .map((chap) => chap.id ?? '')
        .toList();
  }

  @override
  Future<ChapterDto?> deleteChapter(String idChapter) async {
    if (_box.containsKey(idChapter)) {
      final chapter = _box.get(idChapter);
      await _box.delete(idChapter);
      return chapter;
    }
    return Future.value();
  }
}
