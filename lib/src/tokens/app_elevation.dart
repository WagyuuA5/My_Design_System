/// Design token — elevation (shadow depth) scale.
abstract final class AppElevation {
  AppElevation._();

  /// No elevation — flat surface
  static const double none = 0.0;

  /// 1dp — slightly raised (cards)
  static const double sm = 1.0;

  /// 3dp — raised (dropdowns, tooltips)
  static const double md = 3.0;

  /// 6dp — elevated (dialogs, sheets)
  static const double lg = 6.0;

  /// 12dp — floating (FABs, modals)
  static const double xl = 12.0;

  /// 24dp — top layer (snackbars, toasts)
  static const double xxl = 24.0;
}
