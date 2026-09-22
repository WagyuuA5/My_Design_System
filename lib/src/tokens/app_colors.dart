import 'package:flutter/material.dart';

/// Design token — seluruh warna yang digunakan di my_design_system.
///
/// Warna diorganisasi dalam tiga grup:
/// - **Primary / Secondary** — brand palette dengan skala 50-900
/// - **Semantic** — success, warning, error, info
/// - **Neutral** — abu-abu skala 50-900
abstract final class AppColors {
  AppColors._();

  // ── Primary (Indigo) ──────────────────────────────────────────────────────
  static const Color primary50  = Color(0xFFEEF2FF);
  static const Color primary100 = Color(0xFFE0E7FF);
  static const Color primary200 = Color(0xFFC7D2FE);
  static const Color primary300 = Color(0xFFA5B4FC);
  static const Color primary400 = Color(0xFF818CF8);
  static const Color primary500 = Color(0xFF6366F1);
  static const Color primary600 = Color(0xFF4F46E5);
  static const Color primary700 = Color(0xFF4338CA);
  static const Color primary800 = Color(0xFF3730A3);
  static const Color primary900 = Color(0xFF312E81);

  /// Alias utama untuk primary brand color.
  static const Color primary = primary600;

  // ── Secondary (Teal) ──────────────────────────────────────────────────────
  static const Color secondary50  = Color(0xFFF0FDFA);
  static const Color secondary100 = Color(0xFFCCFBF1);
  static const Color secondary200 = Color(0xFF99F6E4);
  static const Color secondary300 = Color(0xFF5EEAD4);
  static const Color secondary400 = Color(0xFF2DD4BF);
  static const Color secondary500 = Color(0xFF14B8A6);
  static const Color secondary600 = Color(0xFF0D9488);
  static const Color secondary700 = Color(0xFF0F766E);
  static const Color secondary800 = Color(0xFF115E59);
  static const Color secondary900 = Color(0xFF134E4A);

  /// Alias utama untuk secondary brand color.
  static const Color secondary = secondary600;

  // ── Semantic — Success (Green) ────────────────────────────────────────────
  static const Color success50  = Color(0xFFF0FDF4);
  static const Color success100 = Color(0xFFDCFCE7);
  static const Color success200 = Color(0xFFBBF7D0);
  static const Color success300 = Color(0xFF86EFAC);
  static const Color success400 = Color(0xFF4ADE80);
  static const Color success500 = Color(0xFF22C55E);
  static const Color success600 = Color(0xFF16A34A);
  static const Color success700 = Color(0xFF15803D);
  static const Color success800 = Color(0xFF166534);
  static const Color success900 = Color(0xFF14532D);

  static const Color success = success600;

  // ── Semantic — Warning (Amber) ────────────────────────────────────────────
  static const Color warning50  = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning200 = Color(0xFFFDE68A);
  static const Color warning300 = Color(0xFFFCD34D);
  static const Color warning400 = Color(0xFFFBBF24);
  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning700 = Color(0xFFB45309);
  static const Color warning800 = Color(0xFF92400E);
  static const Color warning900 = Color(0xFF78350F);

  static const Color warning = warning500;

  // ── Semantic — Error (Red) ────────────────────────────────────────────────
  static const Color error50  = Color(0xFFFFF1F2);
  static const Color error100 = Color(0xFFFFE4E6);
  static const Color error200 = Color(0xFFFECDD3);
  static const Color error300 = Color(0xFFFDA4AF);
  static const Color error400 = Color(0xFFFB7185);
  static const Color error500 = Color(0xFFF43F5E);
  static const Color error600 = Color(0xFFE11D48);
  static const Color error700 = Color(0xFFBE123C);
  static const Color error800 = Color(0xFF9F1239);
  static const Color error900 = Color(0xFF881337);

  static const Color error = error600;

  // ── Semantic — Info (Sky) ─────────────────────────────────────────────────
  static const Color info50  = Color(0xFFF0F9FF);
  static const Color info100 = Color(0xFFE0F2FE);
  static const Color info200 = Color(0xFFBAE6FD);
  static const Color info300 = Color(0xFF7DD3FC);
  static const Color info400 = Color(0xFF38BDF8);
  static const Color info500 = Color(0xFF0EA5E9);
  static const Color info600 = Color(0xFF0284C7);
  static const Color info700 = Color(0xFF0369A1);
  static const Color info800 = Color(0xFF075985);
  static const Color info900 = Color(0xFF0C4A6E);

  static const Color info = info600;

  // ── Neutral (Slate) ───────────────────────────────────────────────────────
  static const Color neutral50  = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);

  // ── Surface / Background ──────────────────────────────────────────────────
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceDark  = Color(0xFF1E293B); // neutral800

  static const Color backgroundLight = neutral50;
  static const Color backgroundDark  = Color(0xFF0F172A); // neutral900
}
