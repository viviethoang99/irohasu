import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../chapter.dart';

abstract class IChapterLocalDatasource {
  ChapterDto saveChapter(ChapterDto chapter);

  ChapterDto? findChapter(String idChapter);

  Future<bool> deteleChapter(String idChapter);

  List<ChapterDto> getAllChapter(String mangaId);
}

@Injectable(as: IChapterLocalDatasource)
class ChapterLocalDatasource implements IChapterLocalDatasource {
  const ChapterLocalDatasource(
    @Named('irohasu_is_bezt_girl') this._isar,
  );

  final Isar _isar;

  @override
  Future<bool> deteleChapter(String idChapter) {
    // TODO: implement deteleChapter
    throw UnimplementedError();
  }

  @override
  ChapterDto? findChapter(String idChapter) {
    // TODO: implement findChapter
    throw UnimplementedError();
  }

  @override
  List<ChapterDto> getAllChapter(String mangaId) {
    // TODO: implement getAllChapter
    throw UnimplementedError();
  }

  @override
  ChapterDto saveChapter(ChapterDto chapter) {
    // TODO: implement saveChapter
    throw UnimplementedError();
  }
}
