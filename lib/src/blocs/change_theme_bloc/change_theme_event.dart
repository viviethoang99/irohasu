part of 'change_theme_bloc.dart';

abstract class ChangeThemeEvent {
  const ChangeThemeEvent();
}

class DecideTheme extends ChangeThemeEvent {}

class LightTheme extends ChangeThemeEvent {
  @override
  String toString() => 'Light Mode';
}

class DarkTheme extends ChangeThemeEvent {
  @override
  String toString() => 'Dark Mode';
}

class BlackTheme extends ChangeThemeEvent {
  @override
  String toString() => 'Black Mode';
}

class LightBlackTheme extends ChangeThemeEvent {
  @override
  String toString() => 'Theo hệ thống (Màu sáng và đen)';
}

class LightDarkTheme extends ChangeThemeEvent {
  @override
  String toString() => 'Theo hệ thống (Màu sáng và tối)';
}
