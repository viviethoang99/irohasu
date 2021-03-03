import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

part 'change_reading_mode_event.dart';

part 'change_reading_mode_state.dart';

class ChangeReadingModeBloc
    extends Bloc<ChangeReadingModeEvent, ChangeReadingModeState> {
  ChangeReadingModeBloc() : super(AdvancedReadingModeState());

  @override
  Stream<ChangeReadingModeState> mapEventToState(
    ChangeReadingModeEvent event,
  ) async* {
    if (event is GetReadingMode) {
      final optionValue = await _getOption();
      if (optionValue == 0) {
        yield AdvancedReadingModeState();
      }
      if (optionValue == 1) {
        yield WebtoonModeState();
      }
    }
    if (event is DefaultMode) {
      yield AdvancedReadingModeState();
      try {
        await _setOptionValue(0);
      } catch (_) {
        throw Exception('Could not persist change');
      }
    }
    if (event is WebtoonMode) {
      yield WebtoonModeState();
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
        .get('sharedPreferences', defaultValue: {}).cast<String, dynamic>();
    if (setting.containsKey('chapterSetting')) {
      setting['chapterSetting']['readingMode'] = optionValue;
    } else {
      setting['chapterSetting'] = {}
        ..putIfAbsent('readingMode', () => optionValue);
    }
    await mangaBox.put('sharedPreferences', setting);
  }

  Future<int> _getOption() async {
    var mangaBox = Hive.box('irohasu');
    var _option = 0;
    var setting = mangaBox.get('sharedPreferences', defaultValue: {});
    if (setting['chapterSetting']?.containsKey('readingMode') ?? false) {
      _option = setting['chapterSetting']['readingMode'];
    }
    return _option;
  }
}
