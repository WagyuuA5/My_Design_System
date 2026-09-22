/// Design token — animation duration scale.
abstract final class AppDuration {
  AppDuration._();

  /// 100ms — micro interactions (ripple, toggle)
  static const Duration fast = Duration(milliseconds: 100);

  /// 200ms — standard transitions (fade, slide)
  static const Duration normal = Duration(milliseconds: 200);

  /// 300ms — complex transitions (page, expansion)
  static const Duration slow = Duration(milliseconds: 300);

  /// 500ms — emphasis animations (skeleton pulse)
  static const Duration emphasis = Duration(milliseconds: 500);

  /// 1500ms — skeleton shimmer cycle
  static const Duration shimmer = Duration(milliseconds: 1500);
}
