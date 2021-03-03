import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:irohasu/src/blocs/change_theme_bloc/change_theme_bloc.dart';
import 'package:irohasu/src/helper/media_query_helper.dart';
import 'package:irohasu/src/models/manga_detail_model.dart';
import 'package:irohasu/src/models/setting_model.dart';

class GeneralSetting extends StatefulWidget {
  static const routeName = '/setting/generaSetting';

  @override
  _GeneralSettingState createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  bool switchValue = false;
  int _selectTheme = 0;

  int _getThemeData() {
    var mangaBox = Hive.box('irohasu');
    var _option = 0;
    var setting = mangaBox.get('sharedPreferences', defaultValue: {});
    if (setting['generalSetting']?.containsKey('themeData') ?? false) {
      _option = setting['generalSetting']['themeData'];
    }
    return _option;
  }

  @override
  void initState() {
    _selectTheme = _getThemeData();
    super.initState();
  }

  //
  void _setThemeMode({int newValue}) {
    switch (newValue) {
      case 0:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightTheme());
        break;
      case 1:
        BlocProvider.of<ChangeThemeBloc>(context).add(BlackTheme());
        break;
      case 2:
        BlocProvider.of<ChangeThemeBloc>(context).add(DarkTheme());
        break;
      case 3:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightBlackTheme());
        break;
      case 4:
        BlocProvider.of<ChangeThemeBloc>(context).add(LightDarkTheme());
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          'Cài đặt chung',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
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
                  color: Theme.of(context).primaryColor,
                ),
              ),
              subtitle: Text(
                _listTheme[0].name,
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
              onTap: _clearCache,
              title: Text(
                'Xoá bộ nhớ cache',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              subtitle: Text(
                'Xoá tất cả cache hiện tại trong máy',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              isThreeLine: true,
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
              FlatButton(
                onPressed: () =>
                    Navigator.of(context, rootNavigator: true).pop(false),
                child: const Text('Không'),
              ),
              FlatButton(
                onPressed: () async {
                  await MangaDetailModel.clearCache();
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
                  children: _listTheme.map((data) {
                    // _selectTheme = _getThemeData();
                    return RadioListTile(
                      activeColor: Theme.of(context).buttonColor,
                      title: Text(
                        data.name,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      value: data.index,
                      groupValue: _selectTheme,
                      onChanged: (context) =>
                          _setThemeMode(newValue: data.index),
                    );
                  }).toList(),
                ),
              ),
            );
          });
        });
  }

  final List<ThemeModel> _listTheme = [
    ThemeModel(index: 0, name: 'Mặc định'),
    ThemeModel(index: 1, name: 'Màu đen'),
    ThemeModel(index: 2, name: 'Màu tối'),
    ThemeModel(index: 3, name: 'Theo hệ thống (Màu trắng và tối)'),
    ThemeModel(index: 4, name: 'Theo hệ thống (Màu trắng và đen)'),
  ];
}
