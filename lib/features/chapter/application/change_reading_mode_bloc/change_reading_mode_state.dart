part of 'change_reading_mode_bloc.dart';

abstract class ChangeReadingModeState {}

class AutoReadingModeState extends ChangeReadingModeState {}

class AdvancedReadingModeState extends ChangeReadingModeState {
  @override
  String toString() {
    return 'Mặc định';
  }
}

class WebtoonModeState extends ChangeReadingModeState {
  @override
  String toString() {
    return 'Webtoon';
  }
}
