import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';
import '../../theme/app_text_style.dart';

/// Ukuran AppTextField — konsisten dengan AppButton.
enum AppTextFieldSize {
  /// Input height ~40px
  sm,

  /// Input height ~48px (default)
  md,

  /// Input height ~56px
  lg,
}

/// Text field utama design system.
///
/// Mendukung error state, helper text, prefix/suffix icon, dan tiga ukuran.
///
/// ```dart
/// AppTextField(
///   label: 'Email',
///   hint: 'contoh@email.com',
///   errorText: _errorMessage,
///   onChanged: (v) => setState(() => _email = v),
/// )
/// ```
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.maxLength,
    this.size = AppTextFieldSize.md,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixText,
    this.suffixText,
  });

  final String? label;
  final String? hint;
  final String? helperText;

  /// Set [errorText] to non-null untuk menampilkan error state.
  final String? errorText;

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool enabled;
  final bool readOnly;
  final bool autofocus;
  final int maxLines;
  final int? minLines;
  final int? maxLength;
  final AppTextFieldSize size;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? prefixText;
  final String? suffixText;

  // ── Sizing helpers ────────────────────────────────────────────────────────
  double get _contentPaddingV => switch (size) {
        AppTextFieldSize.sm => AppSpacing.sm,
        AppTextFieldSize.md => AppSpacing.md,
        AppTextFieldSize.lg => AppSpacing.lg,
      };

  TextStyle get _inputTextStyle => switch (size) {
        AppTextFieldSize.sm => AppTextStyle.bodySm,
        AppTextFieldSize.md => AppTextStyle.bodyMd,
        AppTextFieldSize.lg => AppTextStyle.bodyLg,
      };

  TextStyle get _labelStyle => switch (size) {
        AppTextFieldSize.sm => AppTextStyle.labelSm,
        AppTextFieldSize.md => AppTextStyle.labelMd,
        AppTextFieldSize.lg => AppTextStyle.labelLg,
      };

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final hasError = errorText != null && errorText!.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null) ...[
          Text(
            label!,
            style: _labelStyle.copyWith(color: cs.onSurface),
          ),
          const SizedBox(height: AppSpacing.xs),
        ],
        TextField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          onTap: onTap,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          obscureText: obscureText,
          enabled: enabled,
          readOnly: readOnly,
          autofocus: autofocus,
          maxLines: maxLines,
          minLines: minLines,
          maxLength: maxLength,
          style: _inputTextStyle.copyWith(color: cs.onSurface),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: _inputTextStyle.copyWith(color: cs.onSurfaceVariant),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixText: prefixText,
            suffixText: suffixText,
            contentPadding: EdgeInsets.symmetric(
              horizontal: AppSpacing.lg,
              vertical: _contentPaddingV,
            ),
            filled: true,
            fillColor: enabled
                ? cs.surfaceContainerHighest
                : cs.surfaceContainerHighest.withValues(alpha: 0.5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: hasError
                  ? BorderSide(color: cs.error, width: 1.5)
                  : BorderSide(color: cs.outline, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: hasError
                  ? BorderSide(color: cs.error, width: 2)
                  : BorderSide(color: cs.primary, width: 2),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide(color: cs.error, width: 1.5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide(color: cs.error, width: 2),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppRadius.md),
              borderSide: BorderSide(
                color: cs.outline.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            // We handle error display manually below
            errorText: null,
          ),
        ),
        if (hasError) ...[
          const SizedBox(height: AppSpacing.xs),
          Row(
            children: [
              Icon(Icons.error_outline, size: 14, color: cs.error),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  errorText!,
                  style: AppTextStyle.labelSm.copyWith(color: cs.error),
                ),
              ),
            ],
          ),
        ] else if (helperText != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(
            helperText!,
            style: AppTextStyle.labelSm.copyWith(
              color: cs.onSurfaceVariant,
            ),
          ),
        ],
      ],
    );
  }
}
