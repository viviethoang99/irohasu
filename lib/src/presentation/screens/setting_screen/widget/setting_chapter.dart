import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/base_content.dart';
import '../../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';

class SettingChapter extends StatefulWidget {
  static const routeName = '/chapterSetting';

  @override
  _SettingChapterState createState() => _SettingChapterState();
}

class _SettingChapterState extends State<SettingChapter> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        elevation: 20,
        backgroundColor: theme.backgroundColor,
        title: Text(
          ConstantStrings.settings,
          style: theme.textTheme.headline5,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Cài đặt chung',
                style: TextStyle(
                  color: theme.buttonColor,
                  fontSize: 23,
                ),
              ),
              generalSetting(),
            ],
          ),
        ),
      ),
    );
  }

  Widget generalSetting() {
    final theme = Theme.of(context);
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
                  color: theme.primaryColor,
                ),
              ),
              BlocBuilder<ChangeReadingModeBloc, ChangeReadingModeState>(
                builder: (context, state) {
                  return PopupMenuButton<String>(
                    onSelected: _setReadingMode,
                    itemBuilder: (BuildContext context) {
                      return PopupMenuSetting.listScreenMode
                          .map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(
                            choice,
                            style: TextStyle(
                              fontSize: 20,
                              color: theme.primaryColor,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Text(
                      state.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        color: theme.primaryColor,
                      ),
                    ),
                  );
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
                  color: theme.primaryColor,
                ),
              ),
              BlocBuilder<ChangeBackgroundBloc, ChangeBackgroundState>(
                  builder: (context, state) {
                return PopupMenuButton<String>(
                  onSelected: _setBackgroundColor,
                  itemBuilder: (context) {
                    return PopupMenuSetting.listBackground
                        .map((String choice) => PopupMenuItem<String>(
                              value: choice,
                              child: Text(
                                choice,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: theme.primaryColor,
                                ),
                              ),
                            ))
                        .toList();
                  },
                  child: Text(
                    state.name!,
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColor,
                    ),
                  ),
                );
              })
            ],
          ),
        ],
      ),
    );
  }

  void _setReadingMode(String choice) async {
    if (choice == PopupMenuSetting.webtoon) {
      BlocProvider.of<ChangeReadingModeBloc>(context).add(WebtoonMode());
    } else if (choice == PopupMenuSetting.defaultMode) {
      BlocProvider.of<ChangeReadingModeBloc>(context).add(DefaultMode());
    }
  }

  void _setBackgroundColor(String choice) async {
    if (choice == PopupMenuSetting.white) {
      BlocProvider.of<ChangeBackgroundBloc>(context).add(SetBackgroundWhite());
    } else if (choice == PopupMenuSetting.black) {
      BlocProvider.of<ChangeBackgroundBloc>(context).add(SetBackgroundBlack());
    }
  }
}

class PopupMenuSetting {
  static const String webtoon = 'Webtoon';
  static const String defaultMode = 'Mặc định';

  static const String white = 'Trắng';
  static const String black = 'Đen';

  static const List<String> listScreenMode = <String>[defaultMode, webtoon];

  static const List<String> listBackground = <String>[white, black];
}
