/// Design token — border radius scale.
abstract final class AppRadius {
  AppRadius._();

  /// 0px — no radius
  static const double none = 0.0;

  /// 4px — subtle rounding
  static const double sm = 4.0;

  /// 8px — default for most components
  static const double md = 8.0;

  /// 12px — cards, dialogs
  static const double lg = 12.0;

  /// 16px — sheets, panels
  static const double xl = 16.0;

  /// 24px — large elements
  static const double xxl = 24.0;

  /// 999px — fully rounded (pill/circular)
  static const double full = 999.0;
}
