import 'package:hive/hive.dart';
import '../../env.dart';

class HiveDataSetting {
  HiveDataSetting._();

  static Future getInstance(String page) async {
    final box = await Hive.openBox<dynamic>(ENV.nameDatabase);
    var setting = box.get('sharedPreferences', defaultValue: {});
    if (setting.containsKey(page)) {
      return setting[page];
    }
  }
}
