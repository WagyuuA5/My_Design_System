import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';

/// Variant warna AppBadge — sama dengan AppChip untuk konsistensi.
enum AppBadgeVariant {
  primary,
  secondary,
  neutral,
  success,
  warning,
  danger,
}

/// Ukuran AppBadge.
enum AppBadgeSize {
  sm,
  md,
  lg,
}

/// Badge / label kecil untuk menandai status, jumlah, atau kategori.
///
/// ```dart
/// AppBadge(label: 'Baru')
/// AppBadge(label: '12', variant: AppBadgeVariant.danger)
/// AppBadge.dot(variant: AppBadgeVariant.success) // hanya titik, tanpa label
/// ```
class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.variant = AppBadgeVariant.primary,
    this.size = AppBadgeSize.md,
  }) : _isDot = false;

  const AppBadge.dot({
    super.key,
    this.variant = AppBadgeVariant.primary,
    this.size = AppBadgeSize.md,
  })  : label = '',
        _isDot = true;

  final String label;
  final AppBadgeVariant variant;
  final AppBadgeSize size;
  final bool _isDot;

  // ── Color helpers ─────────────────────────────────────────────────────────
  Color _bgColor(ColorScheme cs) => switch (variant) {
        AppBadgeVariant.primary   => cs.primary,
        AppBadgeVariant.secondary => cs.secondary,
        AppBadgeVariant.neutral   => AppColors.neutral500,
        AppBadgeVariant.success   => AppColors.success600,
        AppBadgeVariant.warning   => AppColors.warning500,
        AppBadgeVariant.danger    => AppColors.error600,
      };

  Color _fgColor(ColorScheme cs) => switch (variant) {
        AppBadgeVariant.primary   => cs.onPrimary,
        AppBadgeVariant.secondary => cs.onSecondary,
        AppBadgeVariant.neutral   => AppColors.neutral50,
        AppBadgeVariant.success   => AppColors.neutral50,
        AppBadgeVariant.warning   => AppColors.neutral50,
        AppBadgeVariant.danger    => AppColors.neutral50,
      };

  // ── Size helpers ──────────────────────────────────────────────────────────
  double get _dotSize => switch (size) {
        AppBadgeSize.sm => 6,
        AppBadgeSize.md => 8,
        AppBadgeSize.lg => 10,
      };

  double get _height => switch (size) {
        AppBadgeSize.sm => 18,
        AppBadgeSize.md => 22,
        AppBadgeSize.lg => 26,
      };

  EdgeInsets get _padding => switch (size) {
        AppBadgeSize.sm => const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
        AppBadgeSize.md => const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        AppBadgeSize.lg => const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      };

  TextStyle get _textStyle => switch (size) {
        AppBadgeSize.sm => AppTextStyle.labelSm,
        AppBadgeSize.md => AppTextStyle.labelSm,
        AppBadgeSize.lg => AppTextStyle.labelMd,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final bg = _bgColor(cs);
    final fg = _fgColor(cs);

    if (_isDot) {
      return Container(
        width: _dotSize,
        height: _dotSize,
        decoration: BoxDecoration(
          color: bg,
          shape: BoxShape.circle,
        ),
      );
    }

    return Container(
      height: _height,
      padding: _padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppRadius.full),
      ),
      child: Center(
        child: Text(
          label,
          style: _textStyle.copyWith(color: fg),
          maxLines: 1,
        ),
      ),
    );
  }
}
