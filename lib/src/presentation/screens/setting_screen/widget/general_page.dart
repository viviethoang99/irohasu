import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/core.dart';
import '../../../../config/config.dart';
import '../../../blocs/change_theme_bloc/change_theme_bloc.dart';

class GeneralSetting extends StatefulWidget {
  const GeneralSetting({Key? key}) : super(key: key);

  static const routeName = '/setting/generaSetting';

  @override
  State<GeneralSetting> createState() => _GeneralSettingState();
}

class _GeneralSettingState extends State<GeneralSetting> {
  int? _selectTheme = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.backgroundColor,
      appBar: AppBar(
        backgroundColor: theme.backgroundColor,
        title: Text(
          'Cài đặt chung',
          style: TextStyle(
            color: theme.primaryColor,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
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
                    Constants.listTheme[state.optionSelect!].name,
                    style: theme.textTheme.subtitle1,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showDialogChangeTheme() {
    showDialog(
        context: context,
        builder: (_) {
          return BlocBuilder<ChangeThemeBloc, ChangeThemeState>(
              builder: (context, state) {
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
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: Constants.listTheme.map((data) {
                    return RadioListTile(
                      activeColor: Theme.of(context).primaryColor,
                      title: Text(
                        data.name,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      value: data.type,
                      groupValue: _selectTheme,
                      onChanged: (value) {
                        final theme = value as ThemeApp;
                        context.read<ChangeThemeBloc>().add(SetTheme(theme));
                      },
                    );
                  }).toList(),
                ),
              ),
            );
          });
        });
  }
}
