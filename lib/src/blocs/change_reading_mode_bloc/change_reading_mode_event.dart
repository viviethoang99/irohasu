part of 'change_reading_mode_bloc.dart';

@immutable
abstract class ChangeReadingModeEvent {}

class DefaultMode extends ChangeReadingModeEvent {}

class WebtoonMode extends ChangeReadingModeEvent {}

class GetReadingMode extends ChangeReadingModeEvent {}
