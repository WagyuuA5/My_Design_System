import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';

/// Variant warna AppChip.
enum AppChipVariant {
  /// Default — warna primary
  primary,

  /// Secondary brand color
  secondary,

  /// Neutral abu-abu
  neutral,

  /// Sukses / hijau
  success,

  /// Peringatan / amber
  warning,

  /// Error / merah
  danger,
}

/// Ukuran AppChip — konsisten dengan komponen lain.
enum AppChipSize {
  sm,
  md,
  lg,
}

/// Chip / tag / filter component.
///
/// ```dart
/// AppChip(label: 'Flutter', onTap: () {})
/// AppChip(label: 'Promo', variant: AppChipVariant.success, selected: true)
/// ```
class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.label,
    this.variant = AppChipVariant.primary,
    this.size = AppChipSize.md,
    this.selected = false,
    this.onTap,
    this.onDeleted,
    this.prefixIcon,
  });

  final String label;
  final AppChipVariant variant;
  final AppChipSize size;
  final bool selected;
  final VoidCallback? onTap;
  final VoidCallback? onDeleted;
  final Widget? prefixIcon;

  // ── Color helpers ─────────────────────────────────────────────────────────
  Color _bgColor(ColorScheme cs) {
    if (selected) {
      return switch (variant) {
        AppChipVariant.primary   => cs.primary,
        AppChipVariant.secondary => cs.secondary,
        AppChipVariant.neutral   => AppColors.neutral600,
        AppChipVariant.success   => AppColors.success600,
        AppChipVariant.warning   => AppColors.warning500,
        AppChipVariant.danger    => AppColors.error600,
      };
    }
    return switch (variant) {
      AppChipVariant.primary   => cs.primaryContainer,
      AppChipVariant.secondary => cs.secondaryContainer,
      AppChipVariant.neutral   => AppColors.neutral100,
      AppChipVariant.success   => AppColors.success100,
      AppChipVariant.warning   => AppColors.warning100,
      AppChipVariant.danger    => AppColors.error100,
    };
  }

  Color _fgColor(ColorScheme cs) {
    if (selected) {
      return switch (variant) {
        AppChipVariant.primary   => cs.onPrimary,
        AppChipVariant.secondary => cs.onSecondary,
        AppChipVariant.neutral   => AppColors.neutral50,
        AppChipVariant.success   => AppColors.neutral50,
        AppChipVariant.warning   => AppColors.neutral50,
        AppChipVariant.danger    => AppColors.neutral50,
      };
    }
    return switch (variant) {
      AppChipVariant.primary   => cs.onPrimaryContainer,
      AppChipVariant.secondary => cs.onSecondaryContainer,
      AppChipVariant.neutral   => AppColors.neutral700,
      AppChipVariant.success   => AppColors.success700,
      AppChipVariant.warning   => AppColors.warning700,
      AppChipVariant.danger    => AppColors.error700,
    };
  }

  // ── Size helpers ──────────────────────────────────────────────────────────
  double get _height => switch (size) {
        AppChipSize.sm => 24,
        AppChipSize.md => 32,
        AppChipSize.lg => 40,
      };

  EdgeInsets get _padding => switch (size) {
        AppChipSize.sm =>
          const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        AppChipSize.md =>
          const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        AppChipSize.lg =>
          const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      };

  TextStyle get _textStyle => switch (size) {
        AppChipSize.sm => AppTextStyle.labelSm,
        AppChipSize.md => AppTextStyle.labelMd,
        AppChipSize.lg => AppTextStyle.labelLg,
      };

  double get _iconSize => switch (size) {
        AppChipSize.sm => 12,
        AppChipSize.md => 14,
        AppChipSize.lg => 16,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = _bgColor(cs);
    final fg = _fgColor(cs);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        height: _height,
        padding: _padding,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (prefixIcon != null) ...[
              IconTheme(
                data: IconThemeData(size: _iconSize, color: fg),
                child: prefixIcon!,
              ),
              const SizedBox(width: 4),
            ],
            Text(label, style: _textStyle.copyWith(color: fg)),
            if (onDeleted != null) ...[
              const SizedBox(width: 4),
              GestureDetector(
                onTap: onDeleted,
                child: Icon(Icons.close, size: _iconSize, color: fg),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
