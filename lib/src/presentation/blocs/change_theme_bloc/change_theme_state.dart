part of 'change_theme_bloc.dart';

class ChangeThemeState extends Equatable {
  ChangeThemeState({this.themeLight, this.themeDark, this.optionSelect});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(
      themeLight: iLightTheme,
      themeDark: null,
      optionSelect: 0,
    );
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(
      themeLight: iDarkTheme,
      themeDark: null,
      optionSelect: 1,
    );
  }

  factory ChangeThemeState.blackTheme() {
    return ChangeThemeState(
      themeLight: iBlackTheme,
      themeDark: null,
      optionSelect: 2,
    );
  }

  factory ChangeThemeState.lightBlackTheme() {
    return ChangeThemeState(
      themeLight: iLightTheme,
      themeDark: iBlackTheme,
      optionSelect: 4,
    );
  }

  factory ChangeThemeState.lightDarkTheme() {
    return ChangeThemeState(
      themeLight: iLightTheme,
      themeDark: iBlackTheme,
      optionSelect: 3,
    );
  }

  final ThemeData? themeLight;
  final ThemeData? themeDark;
  final int? optionSelect;

  @override
  List<Object?> get props => [themeDark, themeLight, optionSelect];
}
