import '../extensions/string_extension.dart';

class ChapHelper {
  static String removeNameManga({
    required String titleChapter,
    required nameManga,
  }) =>
      titleChapter.replaceAll(nameManga, '').trim().capitalize();
}
