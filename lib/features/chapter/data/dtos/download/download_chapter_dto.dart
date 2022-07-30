import 'package:hive_flutter/hive_flutter.dart';

import '../../../domain/domain.dart';

part 'download_chapter_dto.g.dart';

@HiveType(typeId: 3)
class DownloadChapterDto {
  const DownloadChapterDto({
    required this.title,
    required this.idManga,
    required this.idChapter,
    required this.tasks,
  });

  @HiveField(0)
  final String title;
  @HiveField(1)
  final String idManga;
  @HiveField(2)
  final String idChapter;
  @HiveField(3)
  final List<String> tasks;

  DownloadChapter toEntity() {
    return DownloadChapter(
      title: title,
      idChapter: idChapter,
      idManga: idManga,
      tasks: tasks,
    );
  }
}
