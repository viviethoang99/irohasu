part of 'change_theme_bloc.dart';

abstract class ChangeThemeEvent extends Equatable {
  const ChangeThemeEvent();

  @override
  List<Object?> get props => throw UnimplementedError();
}

class GetTheme extends ChangeThemeEvent {}

class SetTheme extends ChangeThemeEvent {
  const SetTheme(this.type);
  final ThemeApp type;

  @override
  List<Object?> get props => [type];
}

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
