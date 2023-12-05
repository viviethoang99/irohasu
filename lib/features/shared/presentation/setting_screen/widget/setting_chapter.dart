import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/text.dart';
import '../../../../../config/config.dart';
import '../../../../chapter/chapter.dart';
import '../../../data/data.dart';

class SettingChapter extends StatefulWidget {
  const SettingChapter({super.key});

  static const routeName = '/chapterSetting';

  @override
  State<SettingChapter> createState() => _SettingChapterState();
}

class _SettingChapterState extends State<SettingChapter> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.background,
        title: IrohaText.regular(
          ConstantStrings.settings,
          fontSize: FontSizes.s20,
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: theme.primaryColor,
          ),
          onPressed: Navigator.of(context).pop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              IrohaText.bold(
                'Cài đặt chung',
                color: theme.primaryColor,
                fontSize: FontSizes.s24,
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
    return Padding(
      padding: const EdgeInsets.only(top: 15, left: 10, right: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                'Chế độ đọc:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
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
                        fontSize: 18,
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
              IrohaText.medium(
                'Màu nền:',
                fontSize: FontSizes.s18,
                color: theme.primaryColor,
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
                    }).toList();
                  },
                  child: Text(
                    state.name!,
                    style: TextStyle(
                      fontSize: 18,
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
