import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../env.dart';
import '../../../config/themes/app_theme.dart';

part 'change_theme_event.dart';
part 'change_theme_state.dart';

class ChangeThemeBloc extends Bloc<ChangeThemeEvent, ChangeThemeState> {
  ChangeThemeBloc() : super(ChangeThemeState.lightTheme()) {
    on<SetTheme>(_setTheme);
    on<LightTheme>(_lightTheme);
    on<BlackTheme>(_blackTheme);
    on<DarkTheme>(_darkTheme);
    on<LightBlackTheme>(_lightBlackTheme);
    on<LightDarkTheme>(_lightDarkTheme);
  }

  Future<void> _setTheme(
    SetTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    final optionValue = await _getOption();
    if (optionValue == 0) {
      emit(ChangeThemeState.lightTheme());
    }
    if (optionValue == 1) {
      emit(ChangeThemeState.blackTheme());
    }
    if (optionValue == 2) {
      emit(ChangeThemeState.darkTheme());
    }
    if (optionValue == 3) {
      emit(ChangeThemeState.lightBlackTheme());
    }
    if (optionValue == 4) {
      emit(ChangeThemeState.lightDarkTheme());
    }
  }

  Future<void> _lightTheme(
    LightTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    emit(ChangeThemeState.lightTheme());
    await _setOptionValue(0);
  }

  Future<void> _blackTheme(
    BlackTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    emit(ChangeThemeState.blackTheme());
    await _setOptionValue(1);
  }

  Future<void> _darkTheme(
    DarkTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    emit(ChangeThemeState.darkTheme());
    await _setOptionValue(2);
  }

  Future<void> _lightBlackTheme(
    LightBlackTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    emit(ChangeThemeState.lightBlackTheme());
    await _setOptionValue(3);
  }

  Future<void> _lightDarkTheme(
    LightDarkTheme event,
    Emitter<ChangeThemeState> emit,
  ) async {
    emit(ChangeThemeState.lightDarkTheme());
    await _setOptionValue(4);
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
