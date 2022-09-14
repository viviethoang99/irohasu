import '../../../download.dart';

class DownloadChapterDto {
  const DownloadChapterDto({
    required this.title,
    required this.idManga,
    required this.idChapter,
    required this.tasks,
  });

  final String title;
  final String idManga;
  final String idChapter;
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
