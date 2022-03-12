import '../core/type/type.dart';

import '../data/model/setting_model/setting_model.dart';

class Constants {
  static final List<ThemeOption> listTheme = const [
    ThemeOption(type: ThemeApp.light, name: 'Màu sáng'),
    ThemeOption(type: ThemeApp.dark, name: 'Màu đen'),
    ThemeOption(type: ThemeApp.black, name: 'Màu tối'),
    ThemeOption(type: ThemeApp.system, name: 'Theo hệ thống'),
  ];

  static const heightAppBar = 80.0;

  static const keywordChapter = ['chương', 'chapter', 'chap'];
}
