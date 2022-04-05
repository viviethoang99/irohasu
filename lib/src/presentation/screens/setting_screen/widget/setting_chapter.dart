import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/base_content.dart';
import '../../../../config/config.dart';
import '../../../../data/model/setting_model/setting_model.dart';
import '../../../blocs/change_background_color_bloc/change_background_bloc.dart';
import '../../../blocs/change_reading_mode_bloc/change_reading_mode_bloc.dart';

class SettingChapter extends StatefulWidget {
  const SettingChapter({Key? key}) : super(key: key);

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
                  color: theme.primaryColor,
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
                'Chế độ đọc',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              BlocBuilder<ChangeReadingModeBloc, ChangeReadingModeState>(
                builder: (context, state) {
                  return PopupMenuButton<ReadingOption>(
                    onSelected: _setReadingMode,
                    itemBuilder: (context) {
                      return Constants.listReadingMode
                          .map((ReadingOption item) {
                        return PopupMenuItem<ReadingOption>(
                          value: item,
                          child: Text(
                            item.name,
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
                return PopupMenuButton<BackgroundReadingOption>(
                  onSelected: _setBackgroundColor,
                  itemBuilder: (context) {
                    return Constants.listBackgroundColor
                        .map((BackgroundReadingOption choice) {
                          return PopupMenuItem<BackgroundReadingOption>(
                              value: choice,
                              child: Text(
                                choice.name,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: theme.primaryColor,
                                ),
                              ),
                            );
                        })
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

  void _setReadingMode(ReadingOption choice) async {
    context.read<ChangeReadingModeBloc>().add(UpdateReadingMode(choice.type));
  }

  void _setBackgroundColor(BackgroundReadingOption choice) async {
    context.read<ChangeBackgroundBloc>().add(SetBackgroundReading(choice.type));
  }
}