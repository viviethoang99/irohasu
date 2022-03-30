import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'change_reading_mode_event.dart';

part 'change_reading_mode_state.dart';

class ChangeReadingModeBloc
    extends Bloc<ChangeReadingModeEvent, ChangeReadingModeState> {
  ChangeReadingModeBloc() : super(AdvancedReadingModeState()) {
    on<GetReadingMode>(_getMode);
    on<DefaultMode>(_defaultMode);
    on<WebtoonMode>(_webtoonMode);
  }

  Future<void> _getMode(
    GetReadingMode event,
    Emitter<ChangeReadingModeState> emit,
  ) async {
    final optionValue = await _getOption();
    if (optionValue == 0) {
      emit(AdvancedReadingModeState());
    }
    if (optionValue == 1) {
      emit(WebtoonModeState());
    }
  }

  Future<void> _defaultMode(
    DefaultMode event,
    Emitter<ChangeReadingModeState> emit,
  ) async {
    emit(AdvancedReadingModeState());
    await _setOptionValue(0);
  }

  Future<void> _webtoonMode(
    WebtoonMode event,
    Emitter<ChangeReadingModeState> emit,
  ) async {
    emit(WebtoonModeState());
    await _setOptionValue(1);
  }

  Future<void> _setOptionValue(int optionValue) async {
    var mangaBox = Hive.box('irohasu');
    var setting = mangaBox
        .get('sharedPreferences', defaultValue: {}).cast<String, dynamic>();
    if (setting.containsKey('chapterSetting')) {
      setting['chapterSetting']['readingMode'] = optionValue;
    } else {
      setting['chapterSetting'] = {}
        ..putIfAbsent('readingMode', () => optionValue);
    }
    await mangaBox.put('sharedPreferences', setting);
  }

  Future<int?> _getOption() async {
    var mangaBox = Hive.box('irohasu');
    int? _option = 0;
    var setting = mangaBox.get('sharedPreferences', defaultValue: {});
    if (setting['chapterSetting']?.containsKey('readingMode') ?? false) {
      _option = setting['chapterSetting']['readingMode'];
    }
    return _option;
  }
}
