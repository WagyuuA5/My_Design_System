import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';
import '../tokens/app_elevation.dart';
import '../tokens/app_radius.dart';
import 'app_colors_extension.dart';
import 'app_text_style.dart';

/// Factory class yang membangun [ThemeData] light dan dark dari design tokens.
///
/// Cara pakai:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
/// )
/// ```
abstract final class AppTheme {
  AppTheme._();

  // ── Shared shape ──────────────────────────────────────────────────────────
  static final _defaultShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(AppRadius.md),
  );

  // ── Light Theme ───────────────────────────────────────────────────────────
  static ThemeData get light {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.light,
      primary: AppColors.primary600,
      onPrimary: AppColors.neutral50,
      primaryContainer: AppColors.primary100,
      onPrimaryContainer: AppColors.primary900,
      secondary: AppColors.secondary600,
      onSecondary: AppColors.neutral50,
      secondaryContainer: AppColors.secondary100,
      onSecondaryContainer: AppColors.secondary900,
      error: AppColors.error600,
      onError: AppColors.neutral50,
      errorContainer: AppColors.error100,
      onErrorContainer: AppColors.error900,
      surface: AppColors.surfaceLight,
      onSurface: AppColors.neutral900,
      surfaceContainerHighest: AppColors.neutral100,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      extension: AppColorsExtension.light,
    );
  }

  // ── Dark Theme ────────────────────────────────────────────────────────────
  static ThemeData get dark {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: Brightness.dark,
      primary: AppColors.primary400,
      onPrimary: AppColors.neutral900,
      primaryContainer: AppColors.primary800,
      onPrimaryContainer: AppColors.primary100,
      secondary: AppColors.secondary400,
      onSecondary: AppColors.neutral900,
      secondaryContainer: AppColors.secondary800,
      onSecondaryContainer: AppColors.secondary100,
      error: AppColors.error400,
      onError: AppColors.neutral900,
      errorContainer: AppColors.error800,
      onErrorContainer: AppColors.error100,
      surface: AppColors.surfaceDark,
      onSurface: AppColors.neutral100,
      surfaceContainerHighest: AppColors.neutral800,
    );

    return _buildTheme(
      colorScheme: colorScheme,
      extension: AppColorsExtension.dark,
    );
  }

  // ── Private builder ───────────────────────────────────────────────────────
  static ThemeData _buildTheme({
    required ColorScheme colorScheme,
    required AppColorsExtension extension,
  }) {
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      textTheme: AppTextStyle.textTheme.apply(
        bodyColor: colorScheme.onSurface,
        displayColor: colorScheme.onSurface,
      ),
      extensions: [extension],

      // ── ElevatedButton ────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          elevation: AppElevation.sm,
          shape: _defaultShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // ── OutlinedButton ────────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: _defaultShape,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        ),
      ),

      // ── TextButton ────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          shape: _defaultShape,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
      ),

      // ── InputDecoration ───────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surfaceContainerHighest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
          borderSide: BorderSide(
            color: colorScheme.error,
            width: 2,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),

      // ── Card ──────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        elevation: AppElevation.sm,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.lg),
        ),
        clipBehavior: Clip.antiAlias,
        color: colorScheme.surface,
      ),

      // ── Chip ──────────────────────────────────────────────────────────────
      chipTheme: ChipThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        side: BorderSide(color: colorScheme.outline),
      ),

      // ── BottomSheet ───────────────────────────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(AppRadius.xl),
          ),
        ),
        backgroundColor: colorScheme.surface,
        elevation: AppElevation.lg,
      ),

      // ── SnackBar ──────────────────────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.md),
        ),
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: AppTextStyle.bodyMd.copyWith(
          color: colorScheme.onInverseSurface,
        ),
      ),
    );
  }
}
