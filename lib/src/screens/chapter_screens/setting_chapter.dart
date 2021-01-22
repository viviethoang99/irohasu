import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../src/constants/base_content.dart';
import '../../../src/helper/hive/hive_preferences_model.dart';

class SettingChapter extends StatefulWidget {
  static const routeName = '/chapterSetting';

  @override
  _SettingChapterState createState() => _SettingChapterState();
}

class _SettingChapterState extends State<SettingChapter> {
  String _screenMode;
  String _colorTheme;
  final _preferences = Preferences.getInstance();
  Preferences preferences;

  @override
  void initState() {
    super.initState();
    _colorTheme = 'white';
    _screenMode = 'default';
    _checkReadingMode();
  }

  Future _checkReadingMode() async {
    preferences = await _preferences;
    setState(() {
      _screenMode = preferences.getReadingMode() ?? 'default';
      _colorTheme = preferences.getBackgroundColorChapter() ?? 'white';
    });
  }

  String _setThemeMode(String data) {
    switch (data) {
      case 'default':
        return PopupMenuSetting.defaultMode;
        break;
      case 'webtoon':
        return PopupMenuSetting.webtoon;
        break;
      default:
        return PopupMenuSetting.defaultMode;
        break;
    }
  }

  String _setBackground(String data) {
    var backgroundColor = 'White';
    switch (data) {
      case 'white':
        backgroundColor = 'Trắng';
        break;
      case 'black':
        backgroundColor = 'Đen';
        break;
      default:
        backgroundColor = 'Trắng';
        break;
    }
    return backgroundColor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).accentColor,
        title: Text(
          Content.settings,
          style: Theme.of(context).textTheme.headline5,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: ValueListenableBuilder(
            valueListenable:
                Hive.box<dynamic>(Preferences.preferencesBox).listenable(),
            builder: (context, Box<dynamic> box, _) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Cài đặt chung',
                      style: TextStyle(
                          color: Theme.of(context).buttonColor, fontSize: 23),
                    ),
                    generalSetting(preferences.getReadingMode(),
                        preferences.getBackgroundColorChapter()),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget generalSetting(String reading, String color) {
    return Container(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Reading Mode',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              PopupMenuButton<String>(
                child: Text(
                  _setThemeMode(reading),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onSelected: selectModeAction,
                itemBuilder: (BuildContext context) {
                  return PopupMenuSetting.listScreenMode.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }).toList();
                },
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Màu nền',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              PopupMenuButton<String>(
                child: Text(
                  _setBackground(color),
                  style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                onSelected: selectBackgroundAction,
                itemBuilder: (BuildContext context) {
                  return PopupMenuSetting.listBackground.map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    );
                  }).toList();
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  void selectModeAction(String choice) async {
    preferences = await _preferences;
    if (choice == PopupMenuSetting.webtoon) {
      await preferences.setReadingMode('webtoon');
    } else if (choice == PopupMenuSetting.defaultMode) {
      await preferences.setReadingMode('default');
    }
  }

  void selectBackgroundAction(String choice) async {
    preferences = await _preferences;
    if (choice == PopupMenuSetting.white) {
      await preferences.setBackgroundColorChapter('white');
    } else if (choice == PopupMenuSetting.black) {
      await preferences.setBackgroundColorChapter('black');
    }
  }
}

class PopupMenuSetting {
  static const String webtoon = 'Webtoon';
  static const String defaultMode = 'Mặc định';

  static const String white = 'Trắng';
  static const String black = 'Đen';

  static const List<String> listScreenMode = <String>[webtoon, defaultMode];

  static const List<String> listBackground = <String>[white, black];
}
