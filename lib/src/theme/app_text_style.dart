import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../tokens/app_colors.dart';

/// Design token — typography scale.
///
/// Menggunakan font **Inter** via [google_fonts] sebagai font utama.
/// Scale mengikuti Material Design 3 dengan nama yang lebih deskriptif:
///
/// | Scale   | Usage |
/// |---------|-------|
/// | display | Hero text, splash screen |
/// | headline | Section titles |
/// | title   | Card/dialog titles |
/// | body    | Readable paragraph text |
/// | label   | Buttons, badges, captions |
///
/// Setiap scale memiliki tiga ukuran: lg, md, sm.
abstract final class AppTextStyle {
  AppTextStyle._();

  // ── Display ───────────────────────────────────────────────────────────────
  static TextStyle get displayLg => GoogleFonts.inter(
        fontSize: 57,
        fontWeight: FontWeight.w700,
        height: 1.12,
        letterSpacing: -0.25,
        color: AppColors.neutral900,
      );

  static TextStyle get displayMd => GoogleFonts.inter(
        fontSize: 45,
        fontWeight: FontWeight.w700,
        height: 1.15,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  static TextStyle get displaySm => GoogleFonts.inter(
        fontSize: 36,
        fontWeight: FontWeight.w700,
        height: 1.22,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  // ── Headline ──────────────────────────────────────────────────────────────
  static TextStyle get headlineLg => GoogleFonts.inter(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.25,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  static TextStyle get headlineMd => GoogleFonts.inter(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 1.28,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  static TextStyle get headlineSm => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 1.33,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  // ── Title ─────────────────────────────────────────────────────────────────
  static TextStyle get titleLg => GoogleFonts.inter(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        height: 1.27,
        letterSpacing: 0,
        color: AppColors.neutral900,
      );

  static TextStyle get titleMd => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.5,
        letterSpacing: 0.15,
        color: AppColors.neutral900,
      );

  static TextStyle get titleSm => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.43,
        letterSpacing: 0.1,
        color: AppColors.neutral900,
      );

  // ── Body ──────────────────────────────────────────────────────────────────
  static TextStyle get bodyLg => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
        letterSpacing: 0.5,
        color: AppColors.neutral700,
      );

  static TextStyle get bodyMd => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.43,
        letterSpacing: 0.25,
        color: AppColors.neutral700,
      );

  static TextStyle get bodySm => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.33,
        letterSpacing: 0.4,
        color: AppColors.neutral700,
      );

  // ── Label ─────────────────────────────────────────────────────────────────
  static TextStyle get labelLg => GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.43,
        letterSpacing: 0.1,
        color: AppColors.neutral800,
      );

  static TextStyle get labelMd => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.33,
        letterSpacing: 0.5,
        color: AppColors.neutral800,
      );

  static TextStyle get labelSm => GoogleFonts.inter(
        fontSize: 11,
        fontWeight: FontWeight.w500,
        height: 1.45,
        letterSpacing: 0.5,
        color: AppColors.neutral800,
      );

  // ── TextTheme helper ──────────────────────────────────────────────────────
  /// Returns a [TextTheme] wired to the typography scale above.
  /// Gunakan ini di [ThemeData.textTheme] di PR 4.
  static TextTheme get textTheme => TextTheme(
        displayLarge: displayLg,
        displayMedium: displayMd,
        displaySmall: displaySm,
        headlineLarge: headlineLg,
        headlineMedium: headlineMd,
        headlineSmall: headlineSm,
        titleLarge: titleLg,
        titleMedium: titleMd,
        titleSmall: titleSm,
        bodyLarge: bodyLg,
        bodyMedium: bodyMd,
        bodySmall: bodySm,
        labelLarge: labelLg,
        labelMedium: labelMd,
        labelSmall: labelSm,
      );
}
