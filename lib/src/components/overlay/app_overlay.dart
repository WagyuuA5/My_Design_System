import 'package:flutter/material.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';

/// Helper untuk menampilkan AppBottomSheet.
///
/// Dipanggil secara statis — tidak perlu widget di tree.
///
/// ```dart
/// AppBottomSheet.show(
///   context: context,
///   title: 'Pilih opsi',
///   child: ListView(...),
/// );
/// ```
abstract final class AppBottomSheet {
  AppBottomSheet._();

  static Future<T?> show<T>({
    required BuildContext context,
    required Widget child,
    String? title,
    String? subtitle,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isScrollControlled = true,
    double? initialChildSize,
    double minChildSize = 0.25,
    double maxChildSize = 0.9,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: isScrollControlled,
      backgroundColor: Colors.transparent,
      builder: (ctx) => _AppBottomSheetContent(
        title: title,
        subtitle: subtitle,
        initialChildSize: initialChildSize ??
            (title != null ? 0.5 : 0.4),
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        child: child,
      ),
    );
  }
}

class _AppBottomSheetContent extends StatelessWidget {
  const _AppBottomSheetContent({
    required this.child,
    this.title,
    this.subtitle,
    required this.initialChildSize,
    required this.minChildSize,
    required this.maxChildSize,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final double initialChildSize;
  final double minChildSize;
  final double maxChildSize;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return DraggableScrollableSheet(
      initialChildSize: initialChildSize,
      minChildSize: minChildSize,
      maxChildSize: maxChildSize,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: cs.surface,
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(AppRadius.xl),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Drag handle
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md),
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: cs.outlineVariant,
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
              ),

              // Title / Subtitle
              if (title != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    AppSpacing.lg,
                    AppSpacing.md,
                    AppSpacing.lg,
                    AppSpacing.xs,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!,
                        style: AppTextStyle.titleMd
                            .copyWith(color: cs.onSurface),
                      ),
                      if (subtitle != null) ...[
                        const SizedBox(height: AppSpacing.xs),
                        Text(
                          subtitle!,
                          style: AppTextStyle.bodyMd
                              .copyWith(color: cs.onSurfaceVariant),
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(height: 1),
              ],

              // Content
              Flexible(
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(AppSpacing.lg),
                  child: child,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// ── AppSnackbar ────────────────────────────────────────────────────────────

/// Variant tampilan AppSnackbar.
enum AppSnackbarVariant {
  /// Snackbar default / informasi
  info,

  /// Sukses (hijau)
  success,

  /// Peringatan (amber)
  warning,

  /// Error / gagal (merah)
  error,
}

/// Helper untuk menampilkan AppSnackbar.
///
/// ```dart
/// AppSnackbar.show(
///   context: context,
///   message: 'Data berhasil disimpan!',
///   variant: AppSnackbarVariant.success,
/// );
/// ```
abstract final class AppSnackbar {
  AppSnackbar._();

  static void show({
    required BuildContext context,
    required String message,
    AppSnackbarVariant variant = AppSnackbarVariant.info,
    String? actionLabel,
    VoidCallback? onAction,
    Duration duration = const Duration(seconds: 3),
  }) {
    final cs = Theme.of(context).colorScheme;

    final (bgColor, fgColor, icon) = switch (variant) {
      AppSnackbarVariant.info    => (cs.inverseSurface, cs.onInverseSurface, Icons.info_outline),
      AppSnackbarVariant.success => (const Color(0xFF166534), const Color(0xFFF0FDF4), Icons.check_circle_outline),
      AppSnackbarVariant.warning => (const Color(0xFF92400E), const Color(0xFFFFFBEB), Icons.warning_amber_outlined),
      AppSnackbarVariant.error   => (const Color(0xFF9F1239), const Color(0xFFFFF1F2), Icons.error_outline),
    };

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor: bgColor,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.md),
          ),
          content: Row(
            children: [
              Icon(icon, color: fgColor, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  message,
                  style: AppTextStyle.bodyMd.copyWith(color: fgColor),
                ),
              ),
            ],
          ),
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: fgColor,
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      );
  }
}
