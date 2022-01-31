import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'change_background_event.dart';

part 'change_background_state.dart';

class ChangeBackgroundBloc
    extends Bloc<ChangeBackgroundEvent, ChangeBackgroundState> {
  ChangeBackgroundBloc() : super(ChangeBackgroundState.black());

  @override
  Stream<ChangeBackgroundState> mapEventToState(
    ChangeBackgroundEvent event,
  ) async* {
    if (event is GetBackgroundColor) {
      final optionValue = await _getOption();
      if (optionValue == 'black') {
        yield ChangeBackgroundState.black();
      }
      if (optionValue == 'white') {
        yield ChangeBackgroundState.white();
      }
    }
    if (event is BackgroundBlack) {
      yield ChangeBackgroundState.black();
      try {
        await _setOptionValue(0);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }
    if (event is BackgroundWhite) {
      yield ChangeBackgroundState.white();
      try {
        await _setOptionValue(1);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }
  }

  Future<Null> _setOptionValue(int optionValue) async {
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
