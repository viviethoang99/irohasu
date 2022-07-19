import '../../core/core.dart';
import '../features/shared/data/data.dart';

class Constants {
  static const List<ThemeOption> listTheme = [
    ThemeOption(type: ThemeApp.light, name: 'Màu sáng'),
    ThemeOption(type: ThemeApp.dark, name: 'Màu đen'),
    ThemeOption(type: ThemeApp.black, name: 'Màu tối'),
    ThemeOption(type: ThemeApp.system, name: 'Theo hệ thống'),
  ];

  static const heightAppBar = 80.0;

  static const keywordChapter = ['chương', 'chapter', 'chap'];

  static const List<ReadingOption> listReadingMode = [
    ReadingOption(type: ReadMode.webtoon, name: 'Mặc định'),
    ReadingOption(type: ReadMode.vertical, name: 'Webtoon'),
  ];
  static const List<BackgroundReadingOption> listBackgroundColor = [
    BackgroundReadingOption(type: BackgroundReading.black, name: 'Nền đen'),
    BackgroundReadingOption(type: BackgroundReading.white, name: 'Nền trắng'),
  ];
}
