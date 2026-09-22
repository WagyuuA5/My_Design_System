import 'package:flutter/material.dart';

import '../../tokens/app_elevation.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';

/// Variant tampilan AppCard.
enum AppCardVariant {
  /// Card dengan shadow/elevation.
  elevated,

  /// Card dengan border outline, tanpa shadow.
  outlined,

  /// Card dengan background filled (pakai surfaceContainerHighest).
  filled,
}

/// Ukuran padding AppCard — konsisten dengan komponen lain.
enum AppCardSize {
  /// Padding 12px
  sm,

  /// Padding 16px (default)
  md,

  /// Padding 24px
  lg,
}

/// Card container dari design system.
///
/// Mendukung tiga variant (elevated/outlined/filled) dan tiga ukuran padding.
///
/// ```dart
/// AppCard(
///   child: Text('Konten card'),
/// )
///
/// AppCard(
///   variant: AppCardVariant.outlined,
///   size: AppCardSize.lg,
///   onTap: () {},
///   child: Column(children: [...]),
/// )
/// ```
class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.size = AppCardSize.md,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  });

  const AppCard.elevated({
    super.key,
    required this.child,
    this.size = AppCardSize.md,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  }) : variant = AppCardVariant.elevated;

  const AppCard.outlined({
    super.key,
    required this.child,
    this.size = AppCardSize.md,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  }) : variant = AppCardVariant.outlined;

  const AppCard.filled({
    super.key,
    required this.child,
    this.size = AppCardSize.md,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.borderRadius,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
    this.backgroundColor,
  }) : variant = AppCardVariant.filled;

  final Widget child;
  final AppCardVariant variant;
  final AppCardSize size;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  /// Override default padding jika diperlukan.
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? width;
  final double? height;
  final Clip clipBehavior;

  /// Override warna background.
  final Color? backgroundColor;

  // ── Sizing helpers ────────────────────────────────────────────────────────
  double get _paddingValue => switch (size) {
        AppCardSize.sm => AppSpacing.md,
        AppCardSize.md => AppSpacing.lg,
        AppCardSize.lg => AppSpacing.xl,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final effectiveBorderRadius =
        borderRadius ?? BorderRadius.circular(AppRadius.lg);
    final effectivePadding =
        padding ?? EdgeInsets.all(_paddingValue);

    final bg = backgroundColor ??
        switch (variant) {
          AppCardVariant.elevated => cs.surface,
          AppCardVariant.outlined => cs.surface,
          AppCardVariant.filled => cs.surfaceContainerHighest,
        };

    final elevation = switch (variant) {
      AppCardVariant.elevated => AppElevation.sm,
      _ => AppElevation.none,
    };

    final border = variant == AppCardVariant.outlined
        ? Border.all(color: cs.outlineVariant, width: 1)
        : null;

    final content = Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: effectiveBorderRadius,
        border: border,
        boxShadow: elevation > 0
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.08),
                  blurRadius: elevation * 3,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: ClipRRect(
        borderRadius: effectiveBorderRadius,
        clipBehavior: clipBehavior,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            borderRadius: effectiveBorderRadius,
            child: Padding(
              padding: effectivePadding,
              child: child,
            ),
          ),
        ),
      ),
    );

    return content;
  }
}
