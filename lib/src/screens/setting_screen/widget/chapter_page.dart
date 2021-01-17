import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/helper/hive/hive_preferences_model.dart';
import 'package:irohasu/src/helper/media_query_helper.dart';
import 'package:irohasu/src/models/setting_model.dart';

class ChapterPageSetting extends StatefulWidget {
  static const routeName = '/setting/chapter';

  @override
  _ChapterPageSettingState createState() => _ChapterPageSettingState();
}

class _ChapterPageSettingState extends State<ChapterPageSetting> {
  bool switchValue = false;
  String _selectTheme = 'default';
  final _preferences = Preferences.getInstance();
  Preferences preferences;

  void _checkThemeMode() async {
    preferences = await _preferences;
    setState(() {
      _selectTheme = preferences.getReadingMode() ?? 'default';
    });
  }

  @override
  void initState() {
    _checkThemeMode();
    super.initState();
  }

  //
  void _setThemeMode(String newValue) async {
    preferences = await _preferences;
    setState(() {
      _selectTheme = newValue;
    });
    await preferences.setReadingMode(_selectTheme);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable:
        Hive.box<dynamic>(Preferences.preferencesBox).listenable(),
        builder: (context, Box<dynamic> box, _) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              brightness: Brightness.light,
              backgroundColor: Colors.grey.shade200,
              iconTheme: const IconThemeData(color: Colors.black),
              title: Text(
                'Cài đặt chung',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: _viewReadingMode,
                    title: Text(
                      'Kiểu đọc',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: Text('Test'),
                  ),
                  ListTile(
                    onTap: () {
                      //TODO
                    },
                    title: Text(
                      'Định dạng ngày tháng',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: const Text('Mặc định hệ thống'),
                  ),
                  ListTile(
                    onTap: () {
                      //TODO
                    },
                    title: Text(
                      'Kiểm tra cập nhật',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor),
                    ),
                    subtitle: const Text('Tự động cập nhật mỗi khi ứng dụng có '
                        'phiên bản mới'),
                    isThreeLine: true,
                    trailing: Switch(
                      activeColor: Theme.of(context).primaryColor,
                      value: switchValue,
                      onChanged: (state) {
                        setState(() {
                          switchValue = !switchValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void _viewReadingMode() {
    showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text(
              'Theme',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Container(
              margin: const EdgeInsets.all(10),
              width: ScreenHelper.getWidth(context),
              height: 300,
              child: Column(
                children: _listScreen.map((data) {
                  return ValueListenableBuilder(
                      valueListenable:
                      Hive.box<dynamic>(Preferences.preferencesBox)
                          .listenable(),
                      builder: (context, Box<dynamic> box, _) {
                        return RadioListTile(
                          activeColor: Theme.of(context).buttonColor,
                          title: Text(
                            data.name,
                            style: const TextStyle(color: Colors.black),
                          ),
                          value: data.index,
                          groupValue: _selectTheme,
                          onChanged: _setThemeMode,
                        );
                      });
                }).toList(),
              ),
            ),
          );
        });
  }

  final List<ReadingMode> _listScreen = [
    ReadingMode(index: 'default', name: 'Mặc định'),
    ReadingMode(index: 'webtoon', name: 'Webtoon'),
  ];
}
