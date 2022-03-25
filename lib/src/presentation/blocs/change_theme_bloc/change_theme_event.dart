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
