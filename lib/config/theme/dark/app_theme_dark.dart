import 'package:flutter/material.dart';
import 'package:rapid_chain/config/theme/dark/color_scheme_dark.dart';
import 'package:rapid_chain/config/theme/dark/dark_theme_interface.dart';
import 'package:rapid_chain/util/constant/general_constant.dart';
import '../app_theme.dart';

class AppThemeLight extends AppTheme with IDarkTheme {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    return _instance ??= AppThemeLight._init();
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        useMaterial3: true,
        splashColor: ColorSchemeDark.instance.Primary.withAlpha(50),
        colorScheme: ColorSchemeDark.instance.appColorScheme,
        iconTheme: IconThemeData(color: ColorSchemeDark.instance.Light),
        unselectedWidgetColor: ColorSchemeDark.instance.Light,
        radioTheme: RadioThemeData(
          fillColor:
              WidgetStateProperty.resolveWith<Color>((Set<WidgetState> states) {
            if (states.contains(WidgetState.selected)) {
              return ColorSchemeDark.instance.Secondary;
            }

            return ColorSchemeDark.instance.Dark;
          }),
        ),
        textTheme: TextTheme(
          displayLarge: TextStyle(
            color: ColorSchemeDark.instance.Title,
            fontSize: 57,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY,
          ),
          displayMedium: TextStyle(
            color: ColorSchemeDark.instance.Title,
            fontSize: 45,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY,
          ),
          displaySmall: TextStyle(
            color: ColorSchemeDark.instance.Title,
            fontSize: 36,
            fontWeight: FontWeight.w400,
            fontFamily: GeneralConstant.FONT_FAMILY,
          ),

          /* headline */
          headlineLarge: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 32,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          headlineMedium: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 28,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          headlineSmall: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 24,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          /* title */
          titleLarge: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 22,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          titleMedium: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: GeneralConstant.FONT_FAMILY),
          titleSmall: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: GeneralConstant.FONT_FAMILY),
          /* body */
          bodyLarge: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          bodyMedium: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          bodySmall: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontFamily: GeneralConstant.FONT_FAMILY),
          /* label */
          labelLarge: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              fontFamily: GeneralConstant.FONT_FAMILY),
          labelMedium: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              fontFamily: GeneralConstant.FONT_FAMILY),
          labelSmall: TextStyle(
              color: ColorSchemeDark.instance.Title,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              fontFamily: GeneralConstant.FONT_FAMILY),
        ),
      );
}
