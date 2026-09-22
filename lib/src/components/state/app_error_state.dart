import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';
import '../button/app_button.dart';

/// Widget "error state" — ditampilkan saat terjadi error / gagal load data.
///
/// ```dart
/// AppErrorState(
///   title: 'Gagal memuat data',
///   description: error.toString(),
///   onRetry: _loadData,
/// )
/// ```
class AppErrorState extends StatelessWidget {
  const AppErrorState({
    super.key,
    this.icon,
    this.illustration,
    this.title = 'Terjadi Kesalahan',
    this.description,
    this.retryLabel = 'Coba Lagi',
    this.onRetry,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  });

  final IconData? icon;
  final Widget? illustration;
  final String title;
  final String? description;
  final String retryLabel;
  final VoidCallback? onRetry;
  final String? secondaryActionLabel;
  final VoidCallback? onSecondaryAction;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Illustration / Icon
            if (illustration != null)
              illustration!
            else
              Icon(
                icon ?? Icons.error_outline_rounded,
                size: 72,
                color: cs.error.withValues(alpha: 0.7),
              ),
            const SizedBox(height: AppSpacing.lg),

            // Title
            Text(
              title,
              style: AppTextStyle.headlineSm.copyWith(color: cs.onSurface),
              textAlign: TextAlign.center,
            ),

            // Description
            if (description != null) ...[
              const SizedBox(height: AppSpacing.sm),
              Text(
                description!,
                style: AppTextStyle.bodyMd.copyWith(
                  color: cs.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
            ],

            // Retry action
            if (onRetry != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton.danger(
                label: retryLabel,
                onPressed: onRetry,
                size: AppButtonSize.md,
              ),
            ],
            if (secondaryActionLabel != null) ...[
              const SizedBox(height: AppSpacing.sm),
              AppButton.ghost(
                label: secondaryActionLabel!,
                onPressed: onSecondaryAction,
                size: AppButtonSize.md,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
