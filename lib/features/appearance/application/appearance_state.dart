part of 'appearance_cubit.dart';

@freezed
class AppearanceState with _$AppearanceState {
  const AppearanceState._();

  const factory AppearanceState({
    required ThemeMode themeMode,
    required String font,
    required String monospaceFont,
  }) = _AppearanceState;

  factory AppearanceState.initial({
    required ThemeMode themeMode,
    required String font,
    required String monospaceFont,
  }) {
    return AppearanceState(
      font: font,
      monospaceFont: monospaceFont,
      themeMode: themeMode,
    );
  }

  ThemeData get lightTheme => _getThemeData(Brightness.light);
  ThemeData get darkTheme => _getThemeData(Brightness.dark);

  ThemeData _getThemeData(Brightness brightness) {
    final fontFamily = font;
    final monospaceFontFamily = monospaceFont;

    final theme = brightness == Brightness.light
        ? const DefaultColorScheme.light()
        : const DefaultColorScheme.dark();

    return ThemeData(
      brightness: brightness,
      textTheme: _getTextTheme(fontFamily: fontFamily, fontColor: theme.text),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: theme.main2,
        selectionHandleColor: theme.main2,
      ),
      iconTheme: IconThemeData(color: theme.icon),
      tooltipTheme: TooltipThemeData(
        textStyle: _getFontStyle(
          fontFamily: fontFamily,
          fontSize: FontSizes.s11,
          fontWeight: FontWeight.w400,
          fontColor: theme.surface,
        ),
      ),
      scaffoldBackgroundColor: theme.surface,
      scrollbarTheme: ScrollbarThemeData(
        thumbColor: MaterialStateProperty.all(theme.shader3),
        thickness: MaterialStateProperty.resolveWith((states) {
          const interactiveStates = <MaterialState>{
            MaterialState.pressed,
            MaterialState.hovered,
            MaterialState.dragged,
          };
          if (states.any(interactiveStates.contains)) {
            return 5.0;
          }
          return 3.0;
        }),
        crossAxisMargin: 0.0,
        mainAxisMargin: 0.0,
        radius: Corners.s10Radius,
      ),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      canvasColor: theme.shader6,
      dividerColor: theme.divider,
      hintColor: theme.hint,
      //action item hover color
      hoverColor: theme.hoverBG2,
      disabledColor: theme.shader4,
      highlightColor: theme.main1,
      indicatorColor: theme.main1,
      cardColor: theme.input,
      colorScheme: ColorScheme(
        brightness: brightness,
        primary: theme.primary,
        onPrimary: theme.onPrimary,
        primaryContainer: theme.main2,
        onPrimaryContainer: _white,
        // page title hover color
        secondary: theme.hoverBG1,
        onSecondary: theme.shader1,
        // setting value hover color
        secondaryContainer: theme.selector,
        onSecondaryContainer: theme.topbarBg,
        tertiary: theme.shader7,
        tertiaryContainer: theme.questionBubbleBG,
        background: theme.surface,
        onBackground: theme.text,
        surface: theme.surface,
        // text&icon color when it is hovered
        onSurface: theme.hoverFG,
        onError: theme.shader7,
        error: theme.red,
        outline: theme.shader4,
        surfaceVariant: theme.sidebarBg,
        shadow: theme.shadow,
      ),
      extensions: [
        AFThemeExtension(
          warning: theme.yellow,
          success: theme.green,
          tint1: theme.tint1,
          tint2: theme.tint2,
          tint3: theme.tint3,
          tint4: theme.tint4,
          tint5: theme.tint5,
          tint6: theme.tint6,
          tint7: theme.tint7,
          tint8: theme.tint8,
          tint9: theme.tint9,
          textColor: theme.text,
          greyHover: theme.hoverBG1,
          greySelect: theme.bg3,
          lightGreyHover: theme.hoverBG3,
          toggleOffFill: theme.shader5,
          progressBarBGcolor: theme.progressBarBGcolor,
          code: _getFontStyle(
            fontFamily: monospaceFontFamily,
            fontColor: theme.shader3,
          ),
          callout: _getFontStyle(
            fontFamily: fontFamily,
            fontSize: FontSizes.s11,
            fontColor: theme.shader3,
          ),
          caption: _getFontStyle(
            fontFamily: fontFamily,
            fontSize: FontSizes.s11,
            fontWeight: FontWeight.w400,
            fontColor: theme.hint,
          ),
        )
      ],
    );
  }

  TextStyle _getFontStyle({
    String? fontFamily,
    double? fontSize,
    FontWeight? fontWeight,
    Color? fontColor,
    double? letterSpacing,
    double? lineHeight,
  }) =>
      TextStyle(
        fontFamily: fontFamily,
        fontSize: fontSize ?? FontSizes.s12,
        color: fontColor,
        fontWeight: fontWeight ?? FontWeight.w400,
        letterSpacing: (fontSize ?? FontSizes.s12) * (letterSpacing ?? 0.005),
        height: lineHeight,
      );

  TextTheme _getTextTheme({
    required String fontFamily,
    required Color fontColor,
  }) {
    return TextTheme(
      displayLarge: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s32,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
        lineHeight: 42.0,
      ), // h2
      displayMedium: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s24,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
        lineHeight: 34.0,
      ), // h3
      displaySmall: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s20,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
        lineHeight: 28.0,
      ), // h4
      titleLarge: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s18,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
      ), // title
      titleMedium: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s16,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
      ), // heading
      titleSmall: _getFontStyle(
        fontFamily: fontFamily,
        fontSize: FontSizes.s14,
        fontColor: fontColor,
        fontWeight: FontWeight.w600,
      ), // subheading
      bodyMedium: _getFontStyle(
        fontFamily: fontFamily,
        fontColor: fontColor,
      ), // body-regular
      bodySmall: _getFontStyle(
        fontFamily: fontFamily,
        fontColor: fontColor,
        fontWeight: FontWeight.w400,
      ), // body-thin
    );
  }
}
