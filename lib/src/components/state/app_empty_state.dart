import 'package:flutter/material.dart';

import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';
import '../button/app_button.dart';

/// Widget "empty state" — ditampilkan saat data kosong atau belum ada konten.
///
/// ```dart
/// AppEmptyState(
///   icon: Icons.inbox_outlined,
///   title: 'Belum ada pesanan',
///   description: 'Pesananmu akan muncul di sini setelah kamu melakukan pembelian.',
///   actionLabel: 'Mulai Belanja',
///   onAction: () => Navigator.push(...),
/// )
/// ```
class AppEmptyState extends StatelessWidget {
  const AppEmptyState({
    super.key,
    this.icon,
    this.illustration,
    required this.title,
    this.description,
    this.actionLabel,
    this.onAction,
    this.secondaryActionLabel,
    this.onSecondaryAction,
  }) : assert(
          icon != null || illustration != null,
          'Provide either icon or illustration',
        );

  /// Ikon Material untuk ditampilkan di atas title.
  final IconData? icon;

  /// Widget ilustrasi kustom (override [icon]).
  final Widget? illustration;

  final String title;
  final String? description;

  /// Label tombol aksi utama (opsional).
  final String? actionLabel;
  final VoidCallback? onAction;

  /// Label tombol aksi sekunder (opsional).
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
                icon,
                size: 72,
                color: cs.onSurfaceVariant.withValues(alpha: 0.5),
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

            // Actions
            if (actionLabel != null) ...[
              const SizedBox(height: AppSpacing.xl),
              AppButton(
                label: actionLabel!,
                onPressed: onAction,
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
