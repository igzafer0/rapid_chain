import 'package:flutter/material.dart';
import 'package:rapid_chain/config/theme/color_scheme.dart';

class ColorSchemeDark extends IColorScheme {
  ColorSchemeDark._init();
  static ColorSchemeDark? _instace;
  static ColorSchemeDark get instance {
    _instace ??= ColorSchemeDark._init();
    return _instace!;
  }

  ColorScheme get appColorScheme {
    return ColorScheme(
        primary: Primary,
        secondary: Colors.green,
        surface: Background,
        error: Colors.green[900]!,
        onPrimary: Colors.green,
        onSecondary: Colors.green,
        onSurface: Colors.green,
        onError: const Color(0xFFF9B916),
        brightness: Brightness.light);
  }

  @override
  Color get Background => const Color.fromARGB(255, 25, 24, 48);

  @override
  Color get Subtitle => Colors.grey;

  @override
  Color get Title => Colors.white;

  @override
  Color get Dark => Colors.black;

  @override
  Color get Light => Colors.white;

  @override
  Color get Primary => const Color.fromARGB(255, 39, 39, 63);

  @override
  Color get Secondary => const Color.fromARGB(255, 14, 180, 233);
}
