import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../../../env.dart';
import 'utils.dart';

part 'change_theme_event.dart';

part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(ChangeThemeState.lightTheme());

  @override
  Stream<ChangeThemeState> mapEventToState(ChangeThemeEvent event) async* {
    if (event is DecideTheme) {
      final optionValue = await _getOption();
      if (optionValue == 0) {
        yield ChangeThemeState.lightTheme();
      }
      if (optionValue == 1) {
        yield ChangeThemeState.blackTheme();
      }
      if (optionValue == 2) {
        yield ChangeThemeState.darkTheme();
      }
      if (optionValue == 3) {
        yield ChangeThemeState.lightBlackTheme();
      }
      if (optionValue == 4) {
        yield ChangeThemeState.lightDarkTheme();
      }
    }

    if (event is LightTheme) {
      yield ChangeThemeState.lightTheme();
      try {
        await _setOptionValue(0);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }

    if (event is BlackTheme) {
      yield ChangeThemeState.blackTheme();
      try {
        await _setOptionValue(1);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }

    if (event is DarkTheme) {
      yield ChangeThemeState.darkTheme();
      try {
        await _setOptionValue(2);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }

    if (event is LightBlackTheme) {
      yield ChangeThemeState.lightBlackTheme();
      try {
        await _setOptionValue(3);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }

    if (event is LightDarkTheme) {
      yield ChangeThemeState.lightDarkTheme();
      try {
        await _setOptionValue(4);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }
  }

  Future<Null> _setOptionValue(int optionValue) async {
    var mangaBox = Hive.box(ENV.nameDatabase);
    var setting = mangaBox
        .get('sharedPreferences', defaultValue: {}).cast<String, dynamic>();
    if (setting.containsKey('generalSetting')) {
      setting['generalSetting']['themeData'] = optionValue;
    } else {
      setting['generalSetting'] = {}
        ..putIfAbsent('themeData', () => optionValue);
    }
    await mangaBox.put('sharedPreferences', setting);
  }

  Future<int?> _getOption() async {
    var mangaBox = Hive.box(ENV.nameDatabase);
    int? _option = 0;
    var setting = mangaBox.get('sharedPreferences', defaultValue: {});
    if (setting['generalSetting']?.containsKey('themeData') ?? false) {
      _option = setting['generalSetting']['themeData'];
    }
    return _option;
  }
}
