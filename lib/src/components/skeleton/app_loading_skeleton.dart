import 'package:flutter/material.dart';

import '../../tokens/app_duration.dart';
import '../../tokens/app_radius.dart';
import '../../tokens/app_spacing.dart';

/// Bentuk AppLoadingSkeleton.
enum AppSkeletonShape {
  /// Persegi panjang dengan radius (teks/card)
  rectangle,

  /// Lingkaran penuh (avatar)
  circle,

  /// Persegi panjang rounded pill
  pill,
}

/// Widget shimmer loading skeleton.
///
/// Gunakan untuk menampilkan placeholder saat data sedang dimuat.
///
/// ```dart
/// // Teks satu baris
/// AppLoadingSkeleton(width: double.infinity, height: 16)
///
/// // Avatar bulat
/// AppLoadingSkeleton.circle(size: 48)
///
/// // Card placeholder
/// AppLoadingSkeleton(width: double.infinity, height: 120)
///
/// // Kumpulan baris teks (pakai AppSkeletonText)
/// AppSkeletonText(lines: 3)
/// ```
class AppLoadingSkeleton extends StatefulWidget {
  const AppLoadingSkeleton({
    super.key,
    required this.width,
    required this.height,
    this.shape = AppSkeletonShape.rectangle,
    this.borderRadius,
  });

  const AppLoadingSkeleton.circle({
    super.key,
    required double size,
  })  : width = size,
        height = size,
        shape = AppSkeletonShape.circle,
        borderRadius = null;

  const AppLoadingSkeleton.pill({
    super.key,
    required this.width,
    this.height = 32,
  })  : shape = AppSkeletonShape.pill,
        borderRadius = null;

  final double width;
  final double height;
  final AppSkeletonShape shape;
  final BorderRadius? borderRadius;

  @override
  State<AppLoadingSkeleton> createState() => _AppLoadingSkeletonState();
}

class _AppLoadingSkeletonState extends State<AppLoadingSkeleton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: AppDuration.shimmer,
    )..repeat(reverse: false);

    _animation = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  BorderRadius get _effectiveBorderRadius {
    if (widget.borderRadius != null) return widget.borderRadius!;
    return switch (widget.shape) {
      AppSkeletonShape.circle => BorderRadius.circular(widget.width / 2),
      AppSkeletonShape.pill   => BorderRadius.circular(AppRadius.full),
      AppSkeletonShape.rectangle => BorderRadius.circular(AppRadius.sm),
    };
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final baseColor = isDark
        ? const Color(0xFF2D3748)
        : const Color(0xFFE2E8F0);
    final shimmerColor = isDark
        ? const Color(0xFF4A5568)
        : const Color(0xFFF7FAFC);

    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: _effectiveBorderRadius,
            gradient: LinearGradient(
              begin: Alignment(_animation.value - 1, 0),
              end: Alignment(_animation.value + 1, 0),
              colors: [baseColor, shimmerColor, baseColor],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }
}

/// Helper widget — kumpulan baris teks skeleton.
///
/// ```dart
/// AppSkeletonText(lines: 3, lastLineWidth: 0.6)
/// ```
class AppSkeletonText extends StatelessWidget {
  const AppSkeletonText({
    super.key,
    this.lines = 3,
    this.lineHeight = 14,
    this.spacing = AppSpacing.sm,
    this.lastLineWidth = 0.75,
  });

  final int lines;
  final double lineHeight;
  final double spacing;

  /// Fraction 0.0–1.0 menentukan lebar baris terakhir (untuk efek teks natural).
  final double lastLineWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: List.generate(lines, (i) {
        final isLast = i == lines - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: i < lines - 1 ? spacing : 0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final w = isLast
                  ? constraints.maxWidth * lastLineWidth
                  : constraints.maxWidth;
              return AppLoadingSkeleton(width: w, height: lineHeight);
            },
          ),
        );
      }),
    );
  }
}

/// Helper widget — card skeleton placeholder.
///
/// ```dart
/// AppSkeletonCard()
/// ```
class AppSkeletonCard extends StatelessWidget {
  const AppSkeletonCard({super.key, this.height = 120});
  final double height;

  @override
  Widget build(BuildContext context) {
    return AppLoadingSkeleton(
      width: double.infinity,
      height: height,
      borderRadius: BorderRadius.circular(AppRadius.lg),
    );
  }
}
