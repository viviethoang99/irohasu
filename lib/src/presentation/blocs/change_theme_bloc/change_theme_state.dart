part of 'change_theme_bloc.dart';

class ChangeThemeState extends Equatable {
  ChangeThemeState({this.themeLight, this.themeDark, this.optionSelect});

  factory ChangeThemeState.lightTheme() {
    return ChangeThemeState(
      themeLight: AppTheme.light,
      themeDark: null,
      optionSelect: 0,
    );
  }

  factory ChangeThemeState.darkTheme() {
    return ChangeThemeState(
      themeLight: AppTheme.dark,
      themeDark: null,
      optionSelect: 1,
    );
  }

  factory ChangeThemeState.blackTheme() {
    return ChangeThemeState(
      themeLight: AppTheme.black,
      themeDark: null,
      optionSelect: 2,
    );
  }

  factory ChangeThemeState.lightBlackTheme() {
    return ChangeThemeState(
      themeLight: AppTheme.light,
      themeDark: AppTheme.black,
      optionSelect: 4,
    );
  }

  factory ChangeThemeState.lightDarkTheme() {
    return ChangeThemeState(
      themeLight: AppTheme.light,
      themeDark: AppTheme.dark,
      optionSelect: 3,
    );
  }

  final ThemeData? themeLight;
  final ThemeData? themeDark;
  final int? optionSelect;

  @override
  List<Object?> get props => [themeDark, themeLight, optionSelect];
}
