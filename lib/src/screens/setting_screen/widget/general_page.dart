import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/change_theme_bloc/change_theme_bloc.dart';
import '../../../config/config.dart';
import '../../../helper/media_query_helper.dart';
import '../../../local/cache_manager_data.dart';

class GeneralSetting extends StatefulWidget {
  static const routeName = '/setting/generaSetting';

  @override
  _GeneralSettingState createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  bool switchValue = false;
  int? _selectTheme = 0;
  final _cacheManagerData = CacheManagerData();

  void _setThemeMode({int? newValue}) {
    switch (newValue) {
      case 0:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightTheme());
        break;
      case 2:
        BlocProvider.of<ChangeThemeBloc>(context).add(BlackTheme());
        break;
      case 1:
        BlocProvider.of<ChangeThemeBloc>(context).add(DarkTheme());
        break;
      case 4:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightBlackTheme());
        break;
      case 3:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightDarkTheme());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.accentColor,
        elevation: 20,
        title: Text(
          'Cài đặt chung',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: _showDialogChangeTheme,
              title: Text(
                'Màu nền',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: theme.primaryColor,
                ),
              ),
              subtitle: BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
                  builder: (context, state) {
                _selectTheme = state.optionSelect;
                return Text(
                  Constants.listTheme[state.optionSelect!].name ??
                      Constants.listTheme[0].name!,
                  style: theme.textTheme.subtitle1,
                );
              }),
            ),
            // ListTile(
            //   onTap: () {
            //     //TODO
            //   },
            //   title: Text(
            //     'Định dạng ngày tháng',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, color: theme.primaryColor),
            //   ),
            //   subtitle:
            //       Text('Mặc định hệ thống', style: theme.textTheme.subtitle1),
            // ),
            ListTile(
              onTap: _clearCache,
              title: Text(
                'Xoá bộ nhớ cache',
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: theme.primaryColor),
              ),
              subtitle: Text(
                'Xoá tất cả cache hiện tại trong máy',
                style: theme.textTheme.subtitle1,
              ),
              isThreeLine: true,
            ),
            // ListTile(
            //   onTap: () {
            //     //TODO
            //   },
            //   title: Text(
            //     'Kiểm tra cập nhật',
            //     style: TextStyle(
            //         fontWeight: FontWeight.bold, color: theme.primaryColor),
            //   ),
            //   subtitle: Text(
            //     'Tự động cập nhật mỗi khi ứng dụng có '
            //     'phiên bản mới',
            //     style: theme.textTheme.subtitle1,
            //   ),
            //   isThreeLine: true,
            //   trailing: Switch(
            //     activeColor: theme.buttonColor,
            //     value: switchValue,
            //     onChanged: (state) {
            //       setState(() {
            //         switchValue = !switchValue;
            //       });
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _clearCache() {
    showDialog<bool>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            content: const Text('Bạn có muốn xoá toàn bộ dữ liệu'),
            actions: [
              TextButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(false),
                child: const Text('Không'),
              ),
              TextButton(
                onPressed: () async {
                  await _cacheManagerData.removeMangaRequestCache();
                  Navigator.of(context, rootNavigator: true).pop(true);
                },
                child: const Text('Có'),
              )
            ],
          );
        });
  }

  void _showDialogChangeTheme() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
              builder: (BuildContext context, state) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              title: Text(
                'Theme',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              content: Container(
                margin: const EdgeInsets.all(10),
                width: ScreenHelper.getWidth(context),
                height: 300,
                child: Column(
                  children: Constants.listTheme.map((data) {
                    return RadioListTile(
                      activeColor: Theme.of(context).buttonColor,
                      title: Text(
                        data.name!,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      value: data.index,
                      groupValue: _selectTheme,
                      onChanged: (dynamic context) =>
                          _setThemeMode(newValue: data.index),
                    );
                  }).toList(),
                ),
              ),
            );
          });
        });
  }
}
