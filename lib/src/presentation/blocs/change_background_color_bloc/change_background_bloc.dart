import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'change_background_event.dart';

part 'change_background_state.dart';

class ChangeBackgroundBloc
    extends Bloc<ChangeBackgroundEvent, ChangeBackgroundState> {
  ChangeBackgroundBloc() : super(ChangeBackgroundState.black()) {
    on<GetBackgroundColor>(_getBackground);
    on<SetBackgroundBlack>(_setBackgroundBlack);
    on<SetBackgroundWhite>(_setBackgroundWhite);
  }

  Future<void> _getBackground(
    GetBackgroundColor event,
    Emitter<ChangeBackgroundState> emit,
  ) async {
    final optionValue = await _getOption();
    if (optionValue == 'black') {
      emit(ChangeBackgroundState.black());
    }
    if (optionValue == 'white') {
      emit(ChangeBackgroundState.white());
    }
  }

  Future<void> _setBackgroundBlack(
    SetBackgroundBlack event,
    Emitter<ChangeBackgroundState> emit,
  ) async {
    emit(ChangeBackgroundState.black());
    await _setOptionValue(0);
  }

  Future<void> _setBackgroundWhite(
    SetBackgroundWhite event,
    Emitter<ChangeBackgroundState> emit,
  ) async {
    emit(ChangeBackgroundState.white());
    await _setOptionValue(0);
  }

  Future<void> _setOptionValue(int optionValue) async {
    var mangaBox = Hive.box('irohasu');
    var setting = mangaBox
        .get('sharedPreferences', defaultValue: {})?.cast<String, dynamic>();
    if (setting.containsKey('chapterSetting')) {
      setting['chapterSetting']['backgroundColor'] = optionValue;
    } else {
      setting['chapterSetting'] = {}
        ..putIfAbsent('backgroundColor', () => optionValue);
    }
    await mangaBox.put('sharedPreferences', setting);
  }

  Future<String?> _getOption() async {
    var mangaBox = Hive.box('irohasu');
    String? _option = 'black';
    var setting = mangaBox.get('sharedPreferences', defaultValue: {});
    if (setting['chapterSetting']?.containsKey('backgroundColor') ?? false) {
      _option = setting['chapterSetting']['backgroundColor'];
    }
    return _option;
  }
}
