import 'package:collection/collection.dart';

import '../../../chapter/chapter.dart';
import '../../download.dart';

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
      tasks: tasks,
    );
  }

  List<ChapterImage>? toListImage() => tasks
      .mapIndexed((number, url) => ChapterImage(urlImage: url, number: number))
      .toList();

  int get total => tasks.isEmpty ? 100 : tasks.length * 100;
}
