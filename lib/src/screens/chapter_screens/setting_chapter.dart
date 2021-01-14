import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive/hive.dart';
import '../../../src/constants/base_content.dart';
import './default_widget/popup_menu_button.dart';

class SettingChapter extends StatefulWidget {
  static const routeName = '/chapterSetting';

  @override
  _SettingChapterState createState() => _SettingChapterState();
}

class _SettingChapterState extends State<SettingChapter> {
  var settingChapter = Hive.box<String>('settingChapter');
  String screenMode;

  @override
  Widget build(BuildContext context) {
    screenMode = getNameScreenMode(settingChapter.get('screenMode'));
    return Scaffold(
      // backgroundColor: Colors.black87,
      appBar: AppBar(
        title: const Text(Content.settings),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Cài đặt chung',
                style: TextStyle(color: Colors.green, fontSize: 23),
              ),
              generalSetting(),
            ],
          ),
        ),
      ),
    );
  }

  Widget generalSetting() {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text(
                'Reading Mode',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                child: Text(
                  screenMode,
                  style: const TextStyle(fontSize: 20),
                ),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return PopupMenuSetting.choices
                      .map((String choice) {
                    return PopupMenuItem<String>(
                      value: choice,
                      child: Text(
                        choice,
                        style: const TextStyle(fontSize: 20),
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
              const Text(
                'Màu nền',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              PopupMenuButton<String>(
                child: const Text(
                  'Đen',
                  style: TextStyle(fontSize: 20),
                ),
                onSelected: choiceAction,
                itemBuilder: (BuildContext context) {
                  return PopupMenuSetting.choices
                      .map((String choice) {
                    return null;
                  }).toList();
                },
              )
            ],
          ),
        ],
      ),
    );
  }

  String getNameScreenMode(String mode) {
    switch (mode){
      case 'vertical':
        screenMode = PopupMenuSetting.webtoon;
        break;
      case 'horizontal':
        screenMode = PopupMenuSetting.defaultMode;
        break;
      default:
        screenMode = PopupMenuSetting.defaultMode;
        break;
    }
    return screenMode;
  }

  void choiceAction(String choice) {
    if (choice == PopupMenuSetting.webtoon) {
      setState(() {
        screenMode = PopupMenuSetting.defaultMode;
        settingChapter.put('screenMode', 'vertical');
      });
    } else if (choice == PopupMenuSetting.defaultMode) {
      setState(() {
        screenMode = PopupMenuSetting.defaultMode;
        settingChapter.put('screenMode', 'horizontal');
      });
    }
  }
}
