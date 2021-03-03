part of 'change_theme_bloc.dart';

class ChangeThemeState {
  ChangeThemeState({this.themeLight, this.themeDark});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(themeLight: iLightTheme, themeDark: null);
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(themeLight: iDarkTheme, themeDark: null);
  }

  factory ChangeThemeState.blackTheme() {
    return ChangeThemeState(themeLight: iBlackTheme, themeDark: null);
  }

  factory ChangeThemeState.lightBlackTheme() {
    return ChangeThemeState(themeLight: iLightTheme, themeDark: iBlackTheme);
  }
  factory ChangeThemeState.lightDarkTheme() {
    return ChangeThemeState(themeLight: iLightTheme, themeDark: iBlackTheme);
  }

  final ThemeData themeLight;
  final ThemeData themeDark;
}
