import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:irohasu/src/models/hive/hive_preferences_model.dart';
import 'package:irohasu/src/helper/media_query_helper.dart';
import 'package:irohasu/src/models/setting_model.dart';

class GeneralSetting extends StatefulWidget {
  static const routeName = '/setting/generaSetting';

  @override
  _GeneralSettingState createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  bool switchValue = false;
  int _selectTheme = 0;
  final _preferences = Preferences.getInstance();
  Preferences preferences;

  void _checkThemeMode() async {
    preferences = await _preferences;
    setState(() {
      _selectTheme = preferences.getAppTheme() ?? 1;
    });
  }

  @override
  void initState() {
    _checkThemeMode();
    super.initState();
  }

  //
  void _setThemeMode(int newValue) async {
    preferences = await _preferences;
    setState(() {
      _selectTheme = newValue;
    });
    await preferences.setAppTheme(_selectTheme);
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
              title: const Text(
                'Cài đặt chung',
                style: TextStyle(
                    color: Colors.black87, fontWeight: FontWeight.bold),
              ),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: <Widget>[
                  ListTile(
                    onTap: _viewThemeMode,
                    title: Text(
                      'Màu nền',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    subtitle: Text(
                      _listTheme[_selectTheme].name,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
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
                      subtitle: Text('Mặc định hệ thống',
                          style: Theme.of(context).textTheme.subtitle1)),
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
                    subtitle: Text(
                      'Tự động cập nhật mỗi khi ứng dụng có '
                      'phiên bản mới',
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    isThreeLine: true,
                    trailing: Switch(
                      activeColor: Theme.of(context).buttonColor,
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

  void _viewThemeMode() {
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
                children: _listTheme.map((data) {
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

  final List<ThemeModel> _listTheme = [
    ThemeModel(index: 0, name: 'Mặc định'),
    ThemeModel(index: 1, name: 'Màu tối'),
    ThemeModel(index: 2, name: 'Màu đen'),
    ThemeModel(index: 3, name: 'Theo hệ thống (Màu trắng và tối)'),
    ThemeModel(index: 4, name: 'Theo hệ thống (Màu trắng và đen)'),
  ];
}
