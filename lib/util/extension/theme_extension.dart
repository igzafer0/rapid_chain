// ignore_for_file: camel_case_extensions

import 'package:flutter/material.dart';
import 'package:rapid_chain/config/theme/dark/app_theme_dark.dart';
import 'package:rapid_chain/util/constant/general_enum.dart';

extension applicationColorToThemeColor on BuildContext {
  Color toColor(APPLICATION_COLOR color) {
    return switch (color) {
      APPLICATION_COLOR.TITLE => AppThemeLight.instance.colorScheme!.Title,
      APPLICATION_COLOR.SUBTITLE =>
        AppThemeLight.instance.colorScheme!.Subtitle,
      APPLICATION_COLOR.BACKGROUND =>
        AppThemeLight.instance.colorScheme!.Background,
      APPLICATION_COLOR.LIGHT => AppThemeLight.instance.colorScheme!.Light,
      APPLICATION_COLOR.DARK => AppThemeLight.instance.colorScheme!.Dark,
      APPLICATION_COLOR.PRIMARY => AppThemeLight.instance.colorScheme!.Primary,
      APPLICATION_COLOR.SECONDARY =>
        AppThemeLight.instance.colorScheme!.Secondary,
      APPLICATION_COLOR.OPPOSITE => AppThemeLight.instance.colorScheme!.Light,
    };
  }

  TextStyle toTextStyle(FONT_SIZE size) {
    return switch (size) {
      FONT_SIZE.DISPLAY_LARGE =>
        AppThemeLight.instance.theme.textTheme.displayLarge!,
      FONT_SIZE.DISPLAY_MEDIUM =>
        AppThemeLight.instance.theme.textTheme.displayMedium!,
      FONT_SIZE.DISPLAY_SMALL =>
        AppThemeLight.instance.theme.textTheme.displaySmall!,
      FONT_SIZE.HEADLINE_LARGE =>
        AppThemeLight.instance.theme.textTheme.headlineLarge!,
      FONT_SIZE.HEADLINE_MEDIUM =>
        AppThemeLight.instance.theme.textTheme.headlineMedium!,
      FONT_SIZE.HEADLINE_SMALL =>
        AppThemeLight.instance.theme.textTheme.headlineSmall!,
      FONT_SIZE.TITLE_LARGE =>
        AppThemeLight.instance.theme.textTheme.titleLarge!,
      FONT_SIZE.TITLE_MEDIUM =>
        AppThemeLight.instance.theme.textTheme.titleMedium!,
      FONT_SIZE.TITLE_SMALL =>
        AppThemeLight.instance.theme.textTheme.titleSmall!,
      FONT_SIZE.BODY_LARGE => AppThemeLight.instance.theme.textTheme.bodyLarge!,
      FONT_SIZE.BODY_MEDIUM =>
        AppThemeLight.instance.theme.textTheme.bodyMedium!,
      FONT_SIZE.BODY_SMALL => AppThemeLight.instance.theme.textTheme.bodySmall!,
      FONT_SIZE.LABEL_LARGE =>
        AppThemeLight.instance.theme.textTheme.labelLarge!,
      FONT_SIZE.LABEL_MEDIUM =>
        AppThemeLight.instance.theme.textTheme.labelMedium!,
      FONT_SIZE.LABEL_SMALL =>
        AppThemeLight.instance.theme.textTheme.labelSmall!,
    };
  }
}
