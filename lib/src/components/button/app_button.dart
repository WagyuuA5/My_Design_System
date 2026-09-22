import 'package:flutter/material.dart';

import '../../tokens/app_colors.dart';
import '../../tokens/app_duration.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';

/// Variant tampilan AppButton.
enum AppButtonVariant {
  /// Background solid brand color (primary action).
  primary,

  /// Border outline, no fill (secondary action).
  secondary,

  /// No border, no fill, text only (tertiary/ghost action).
  ghost,

  /// Destructive/danger action — merah.
  danger,
}

/// Ukuran AppButton.
enum AppButtonSize {
  /// Compact — 32px height, font labelSm.
  sm,

  /// Default — 44px height, font labelMd.
  md,

  /// Large — 52px height, font labelLg.
  lg,
}

/// Tombol utama design system.
///
/// Mendukung empat variant, tiga ukuran, state loading, dan state disabled.
///
/// ```dart
/// AppButton(
///   label: 'Simpan',
///   onPressed: () {},
/// )
///
/// AppButton.danger(
///   label: 'Hapus',
///   onPressed: _handleDelete,
///   size: AppButtonSize.lg,
/// )
/// ```
class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  });

  const AppButton.primary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  }) : variant = AppButtonVariant.primary;

  const AppButton.secondary({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  }) : variant = AppButtonVariant.secondary;

  const AppButton.ghost({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  }) : variant = AppButtonVariant.ghost;

  const AppButton.danger({
    super.key,
    required this.label,
    required this.onPressed,
    this.size = AppButtonSize.md,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefixIcon,
    this.suffixIcon,
    this.width,
  }) : variant = AppButtonVariant.danger;

  final String label;
  final VoidCallback? onPressed;
  final AppButtonVariant variant;
  final AppButtonSize size;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  /// Set [width] to double.infinity for full-width button.
  final double? width;

  // ── Sizing helpers ────────────────────────────────────────────────────────
  double get _height => switch (size) {
        AppButtonSize.sm => 32,
        AppButtonSize.md => 44,
        AppButtonSize.lg => 52,
      };

  TextStyle get _textStyle => switch (size) {
        AppButtonSize.sm => AppTextStyle.labelSm,
        AppButtonSize.md => AppTextStyle.labelMd,
        AppButtonSize.lg => AppTextStyle.labelLg,
      };

  double get _iconSize => switch (size) {
        AppButtonSize.sm => 14,
        AppButtonSize.md => 18,
        AppButtonSize.lg => 22,
      };

  double get _horizontalPadding => switch (size) {
        AppButtonSize.sm => AppSpacing.md,
        AppButtonSize.md => AppSpacing.lg,
        AppButtonSize.lg => AppSpacing.xl,
      };

  double get _spinnerSize => switch (size) {
        AppButtonSize.sm => 14,
        AppButtonSize.md => 18,
        AppButtonSize.lg => 22,
      };

  // ── Color helpers ─────────────────────────────────────────────────────────
  Color _bgColor(ColorScheme cs) => switch (variant) {
        AppButtonVariant.primary => cs.primary,
        AppButtonVariant.secondary => Colors.transparent,
        AppButtonVariant.ghost => Colors.transparent,
        AppButtonVariant.danger => AppColors.error600,
      };

  Color _fgColor(ColorScheme cs) => switch (variant) {
        AppButtonVariant.primary => cs.onPrimary,
        AppButtonVariant.secondary => cs.primary,
        AppButtonVariant.ghost => cs.primary,
        AppButtonVariant.danger => AppColors.neutral50,
      };

  Color? _borderColor(ColorScheme cs) => switch (variant) {
        AppButtonVariant.secondary => cs.primary,
        AppButtonVariant.danger => AppColors.error600,
        _ => null,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final effectiveCallback = (isDisabled || isLoading) ? null : onPressed;
    final fg = _fgColor(cs);
    final border = _borderColor(cs);

    return AnimatedOpacity(
      opacity: isDisabled ? 0.45 : 1.0,
      duration: AppDuration.fast,
      child: SizedBox(
        height: _height,
        width: width,
        child: TextButton(
          onPressed: effectiveCallback,
          style: TextButton.styleFrom(
            backgroundColor: _bgColor(cs),
            foregroundColor: fg,
            padding: EdgeInsets.symmetric(horizontal: _horizontalPadding),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              side: border != null
                  ? BorderSide(color: border)
                  : BorderSide.none,
            ),
            textStyle: _textStyle,
          ),
          child: AnimatedSwitcher(
            duration: AppDuration.fast,
            child: isLoading
                ? SizedBox(
                    key: const ValueKey('loading'),
                    width: _spinnerSize,
                    height: _spinnerSize,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(fg),
                    ),
                  )
                : Row(
                    key: const ValueKey('content'),
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (prefixIcon != null) ...[
                        IconTheme(
                          data: IconThemeData(size: _iconSize, color: fg),
                          child: prefixIcon!,
                        ),
                        const SizedBox(width: AppSpacing.xs),
                      ],
                      Text(label, style: _textStyle.copyWith(color: fg)),
                      if (suffixIcon != null) ...[
                        const SizedBox(width: AppSpacing.xs),
                        IconTheme(
                          data: IconThemeData(size: _iconSize, color: fg),
                          child: suffixIcon!,
                        ),
                      ],
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
