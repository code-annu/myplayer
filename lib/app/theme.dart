import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff0058be),
      surfaceTint: Color(0xff005ac2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff006fed),
      onPrimaryContainer: Color(0xfffefcff),
      secondary: Color(0xff415e96),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffa1befd),
      onSecondaryContainer: Color(0xff2e4c84),
      tertiary: Color(0xff8e2bb2),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffaa48cd),
      onTertiaryContainer: Color(0xfffffbff),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff181b23),
      onSurfaceVariant: Color(0xff414755),
      outline: Color(0xff717786),
      outlineVariant: Color(0xffc1c6d7),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3039),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff27467d),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff330045),
      tertiaryFixedDim: Color(0xffeeb0ff),
      onTertiaryFixedVariant: Color(0xff76039a),
      surfaceDim: Color(0xffd8d9e5),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fe),
      surfaceContainer: Color(0xffecedf9),
      surfaceContainerHigh: Color(0xffe6e8f3),
      surfaceContainerHighest: Color(0xffe0e2ed),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff003475),
      surfaceTint: Color(0xff005ac2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff0068df),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff12346b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff506ca6),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff5c007a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffa140c5),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff0e1119),
      onSurfaceVariant: Color(0xff313643),
      outline: Color(0xff4d5261),
      outlineVariant: Color(0xff676d7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3039),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xff0068df),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff0051b0),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff506ca6),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff36548c),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xffa140c5),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff8621aa),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc4c6d1),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff1f3fe),
      surfaceContainer: Color(0xffe6e8f3),
      surfaceContainerHigh: Color(0xffdadce7),
      surfaceContainerHighest: Color(0xffcfd1dc),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff002a62),
      surfaceTint: Color(0xff005ac2),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff004699),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff022a61),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff2a4880),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff4d0066),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff780a9d),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfff9f9ff),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff272c39),
      outlineVariant: Color(0xff444957),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3039),
      inversePrimary: Color(0xffaec6ff),
      primaryFixed: Color(0xff004699),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff00306e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff2a4880),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff0d3167),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff780a9d),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff570073),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffb6b8c3),
      surfaceBright: Color(0xfff9f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xffeef0fc),
      surfaceContainer: Color(0xffe0e2ed),
      surfaceContainerHigh: Color(0xffd2d4df),
      surfaceContainerHighest: Color(0xffc4c6d1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaec6ff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff002e6a),
      primaryContainer: Color(0xff4d8eff),
      onPrimaryContainer: Color(0xff001334),
      secondary: Color(0xffaec6ff),
      onSecondary: Color(0xff092e65),
      secondaryContainer: Color(0xff2a487f),
      onSecondaryContainer: Color(0xff9cb8f7),
      tertiary: Color(0xffeeb0ff),
      onTertiary: Color(0xff53006f),
      tertiaryContainer: Color(0xffc966ec),
      onTertiaryContainer: Color(0xff280037),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff10131b),
      onSurface: Color(0xffe0e2ed),
      onSurfaceVariant: Color(0xffc1c6d7),
      outline: Color(0xff8b90a0),
      outlineVariant: Color(0xff414755),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ed),
      inversePrimary: Color(0xff005ac2),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff001a42),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff004395),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff001a42),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff27467d),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff330045),
      tertiaryFixedDim: Color(0xffeeb0ff),
      onTertiaryFixedVariant: Color(0xff76039a),
      surfaceDim: Color(0xff10131b),
      surfaceBright: Color(0xff363942),
      surfaceContainerLowest: Color(0xff0b0e16),
      surfaceContainerLow: Color(0xff181b23),
      surfaceContainer: Color(0xff1c2028),
      surfaceContainerHigh: Color(0xff272a32),
      surfaceContainerHighest: Color(0xff31353d),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffcfdcff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff002455),
      primaryContainer: Color(0xff4d8eff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffcfdcff),
      onSecondary: Color(0xff002455),
      secondaryContainer: Color(0xff7490cd),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xfff7cfff),
      onTertiary: Color(0xff420059),
      tertiaryContainer: Color(0xffc966ec),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff10131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffd7dced),
      outline: Color(0xffacb2c2),
      outlineVariant: Color(0xff8b90a0),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ed),
      inversePrimary: Color(0xff004597),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff00102e),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff003475),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff00102e),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff12346b),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff230030),
      tertiaryFixedDim: Color(0xffeeb0ff),
      onTertiaryFixedVariant: Color(0xff5c007a),
      surfaceDim: Color(0xff10131b),
      surfaceBright: Color(0xff41444d),
      surfaceContainerLowest: Color(0xff05070e),
      surfaceContainerLow: Color(0xff1a1d25),
      surfaceContainer: Color(0xff252830),
      surfaceContainerHigh: Color(0xff2f323b),
      surfaceContainerHighest: Color(0xff3a3d46),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffecefff),
      surfaceTint: Color(0xffaec6ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffa7c2ff),
      onPrimaryContainer: Color(0xff000a22),
      secondary: Color(0xffecefff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffa7c2ff),
      onSecondaryContainer: Color(0xff000a22),
      tertiary: Color(0xffffeaff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffecabff),
      onTertiaryContainer: Color(0xff190024),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff10131b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xffecefff),
      outlineVariant: Color(0xffbdc2d3),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2ed),
      inversePrimary: Color(0xff004597),
      primaryFixed: Color(0xffd8e2ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffaec6ff),
      onPrimaryFixedVariant: Color(0xff00102e),
      secondaryFixed: Color(0xffd8e2ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffaec6ff),
      onSecondaryFixedVariant: Color(0xff00102e),
      tertiaryFixed: Color(0xfffad7ff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffeeb0ff),
      onTertiaryFixedVariant: Color(0xff230030),
      surfaceDim: Color(0xff10131b),
      surfaceBright: Color(0xff4d5059),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff1c2028),
      surfaceContainer: Color(0xff2d3039),
      surfaceContainerHigh: Color(0xff383b44),
      surfaceContainerHighest: Color(0xff444750),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.surface,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
