import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../chapter/chapter.dart';

abstract class IDownloadLocalSource {
  Future<List<String>> getPathsImageChapter(List<String> tasks);

  Future<int> getProgress(List<String> tasks);

  Future<bool> deleteImageChapter(List<String> paths);

  Stream<List<ChapterDto>> watchListChapterDownload(String idManga);

  Future<List<ChapterDto>> findAllChapterDownload(String idManga);

  Future<ChapterDto?> deleteChapter(int idChapter);
}

@Injectable(as: IDownloadLocalSource)
class DownloadLocalSourceImpl implements IDownloadLocalSource {
  const DownloadLocalSourceImpl(
    @Named('irohasu_is_bezt_girl') this._isar,
  );
  final Isar _isar;

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
  Stream<List<ChapterDto>> watchListChapterDownload(String idManga) {
    final chapters =
        _isar.chapterDtos.filter().idMangaContains(idManga).build();
    return chapters.watch(fireImmediately: true);
  }

  @override
  Future<List<ChapterDto>> findAllChapterDownload(String idManga) {
    return _isar.chapterDtos.filter().idMangaContains(idManga).findAll();
  }

  @override
  Future<ChapterDto?> deleteChapter(int idChapter) async {
    final contacts = _isar.chapterDtos;
    return _isar.writeTxn(() async {
      await contacts.delete(idChapter);
      return;
    });
  }
}
