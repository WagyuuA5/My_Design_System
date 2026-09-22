import 'package:flutter/material.dart';

import '../tokens/app_colors.dart';

/// ThemeExtension untuk warna custom yang tidak ada di [ColorScheme] Material.
///
/// Cara pakai:
/// ```dart
/// final ext = Theme.of(context).extension<AppColorsExtension>()!;
/// ext.success // warna sukses
/// ```
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  const AppColorsExtension({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color info;
  final Color onInfo;
  final Color infoContainer;

  /// Light theme extension colors.
  static const AppColorsExtension light = AppColorsExtension(
    success: AppColors.success600,
    onSuccess: AppColors.neutral50,
    successContainer: AppColors.success100,
    warning: AppColors.warning500,
    onWarning: AppColors.neutral50,
    warningContainer: AppColors.warning100,
    info: AppColors.info600,
    onInfo: AppColors.neutral50,
    infoContainer: AppColors.info100,
  );

  /// Dark theme extension colors.
  static const AppColorsExtension dark = AppColorsExtension(
    success: AppColors.success400,
    onSuccess: AppColors.neutral900,
    successContainer: AppColors.success800,
    warning: AppColors.warning400,
    onWarning: AppColors.neutral900,
    warningContainer: AppColors.warning800,
    info: AppColors.info400,
    onInfo: AppColors.neutral900,
    infoContainer: AppColors.info800,
  );

  @override
  AppColorsExtension copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
  }) {
    return AppColorsExtension(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
    );
  }

  @override
  AppColorsExtension lerp(AppColorsExtension? other, double t) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer:
          Color.lerp(successContainer, other.successContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      warningContainer:
          Color.lerp(warningContainer, other.warningContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
    );
  }
}
