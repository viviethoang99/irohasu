import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';

import '../../../chapter.dart';

abstract class IChapterLocalDatasource {
  ChapterDto saveChapter(ChapterDto chapter);

  ChapterDto? findChapter(String idChapter);

  Stream<ChapterDto?> watchChapterDownload(String idChapter);

  Future<bool> deteleChapter(String idChapter);

  List<ChapterDto> getAllChapter(String mangaId);
}

@Injectable(as: IChapterLocalDatasource)
class ChapterLocalDatasource implements IChapterLocalDatasource {
  const ChapterLocalDatasource(
    @Named('download_chapter_box') this._box,
  );

  final Box<ChapterDto> _box;

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
  ChapterDto? findChapter(String idChapter) {
    return _box.get(idChapter);
  }

  @override
  List<ChapterDto> getAllChapter(String mangaId) {
    return _box.values.where((chapter) => chapter.idManga == mangaId).toList();
  }

  @override
  ChapterDto saveChapter(ChapterDto chapter) {
    _box.put(chapter.id, chapter);
    return chapter;
  }

  @override
  Stream<ChapterDto?> watchChapterDownload(String idChapter) {
    return _box.watch(key: idChapter).map((_) => findChapter(idChapter));
  }
}
