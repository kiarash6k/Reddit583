import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract final class AppTheme {
  static final ThemeData dark = _build(
    const ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.mint,
      onPrimary: AppColors.deepGreen,
      secondary: AppColors.teal,
      onSecondary: Colors.white,
      error: Color(0xFFFF8A80),
      onError: Colors.black,
      surface: AppColors.slate,
      onSurface: Colors.white,
      surfaceContainer: AppColors.forest,
      onSurfaceVariant: Color(0xFFB9D6CE),
      outline: AppColors.mint,
    ),
  );

  static final ThemeData light = _build(
    const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.forest,
      onPrimary: Colors.white,
      secondary: AppColors.teal,
      onSecondary: Colors.white,
      error: Color(0xFFB3261E),
      onError: Colors.white,
      surface: Color(0xFFF1F6F4),
      onSurface: Color(0xFF16302B),
      surfaceContainer: Colors.white,
      onSurfaceVariant: Color(0xFF4F6B65),
      outline: AppColors.forest,
    ),
  );

  static ThemeData _build(ColorScheme scheme) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: scheme.outline, width: 1.5),
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.forest,
        foregroundColor: AppColors.mint,
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainer,
        elevation: 0,
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: border,
        enabledBorder: border,
        focusedBorder: border.copyWith(
            borderSide: BorderSide(color: scheme.primary, width: 2.5)),
        errorBorder: border.copyWith(
            borderSide: BorderSide(color: scheme.error, width: 1.5)),
        focusedErrorBorder: border.copyWith(
            borderSide: BorderSide(color: scheme.error, width: 2.5)),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          minimumSize: const Size.fromHeight(52),
          shape: const StadiumBorder(),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      snackBarTheme:
          const SnackBarThemeData(behavior: SnackBarBehavior.floating),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.primary,
        textColor: scheme.onSurface,
      ),
      dividerTheme:
          DividerThemeData(color: scheme.onSurface.withValues(alpha: 0.15)),
    );
  }
}
