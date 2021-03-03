part of 'change_reading_mode_bloc.dart';

@immutable
abstract class ChangeReadingModeState {}

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