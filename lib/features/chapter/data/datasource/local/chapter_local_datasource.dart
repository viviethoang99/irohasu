import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../chapter.dart';

abstract class IChapterLocalDatasource {
  DownloadChapterDto saveChapter(DownloadChapterDto chapter);

  DownloadChapterDto? findChapter(String idChapter);

  Stream<DownloadChapterDto?> watchChapterDownload(String idChapter);

  Future<bool> deteleChapter(String idChapter);

  List<DownloadChapterDto> getAllChapter(String mangaId);
}

@Injectable(as: IChapterLocalDatasource)
class ChapterLocalDatasource implements IChapterLocalDatasource {
  const ChapterLocalDatasource(
    @Named('download_chapter_box') this._box,
  );

  final Box<DownloadChapterDto> _box;

  @override
  Future<bool> deteleChapter(String idChapter) async {
    try {
      await _box.delete(idChapter);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  DownloadChapterDto? findChapter(String idChapter) {
    return _box.get(idChapter);
  }

  @override
  List<DownloadChapterDto> getAllChapter(String mangaId) {
    return _box.values.where((chapter) => chapter.idManga == mangaId).toList();
  }

  @override
  DownloadChapterDto saveChapter(DownloadChapterDto chapter) {
    _box.put(chapter.idChapter, chapter);
    return chapter;
  }

  @override
  Stream<DownloadChapterDto?> watchChapterDownload(String idChapter) {
    return _box.watch(key: idChapter).map((_) => findChapter(idChapter));
  }
}
