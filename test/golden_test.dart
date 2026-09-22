// Golden tests untuk my_design_system.
//
// PENTING: Golden file di test/goldens/ di-generate di Windows 11 dengan
// Flutter 3.38.3 (Dart 3.10.1). Golden test MUNGKIN gagal jika dijalankan
// di platform lain (Linux/macOS) karena perbedaan font rendering dan
// sub-pixel anti-aliasing. Ini bukan bug — jalankan flutter test --update-goldens
// di platform yang sama untuk regenerasi golden file.
//
// Untuk regenerasi:
//   flutter test test/golden_test.dart --update-goldens
//
// Platform saat generate: Windows 11, Flutter 3.38.3, Dart 3.10.1

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:my_design_system/my_design_system.dart';

// Helper untuk wrap widget dengan MaterialApp + design system theme
Widget _wrap(Widget child, {bool dark = false}) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: dark ? AppTheme.dark : AppTheme.light,
    home: Scaffold(
      backgroundColor: dark
          ? AppColors.backgroundDark
          : AppColors.backgroundLight,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: child,
        ),
      ),
    ),
  );
}

void main() {
  // ── AppButton ─────────────────────────────────────────────────────────────
  group('AppButton golden', () {
    testWidgets('primary md light', (tester) async {
      await tester.pumpWidget(
        _wrap(const AppButton(label: 'Primary', onPressed: null)),
      );
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('goldens/app_button_primary_md_light.png'),
      );
    });

    testWidgets('all variants row light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: const [
              AppButton(label: 'Primary', onPressed: null),
              AppButton.secondary(label: 'Secondary', onPressed: null),
              AppButton.ghost(label: 'Ghost', onPressed: null),
              AppButton.danger(label: 'Danger', onPressed: null),
            ],
          ),
        ),
      );
      await expectLater(
        find.byType(Wrap),
        matchesGoldenFile('goldens/app_button_all_variants_light.png'),
      );
    });

    testWidgets('primary md dark', (tester) async {
      await tester.pumpWidget(
        _wrap(const AppButton(label: 'Primary Dark', onPressed: null),
            dark: true),
      );
      await expectLater(
        find.byType(AppButton),
        matchesGoldenFile('goldens/app_button_primary_md_dark.png'),
      );
    });
  });

  // ── AppTextField ──────────────────────────────────────────────────────────
  group('AppTextField golden', () {
    testWidgets('default md light no error', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 300,
            child: AppTextField(
              label: 'Email',
              hint: 'contoh@email.com',
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(AppTextField),
        matchesGoldenFile('goldens/app_textfield_md_light.png'),
      );
    });

    testWidgets('with error state light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 300,
            child: AppTextField(
              label: 'Email',
              hint: 'contoh@email.com',
              errorText: 'Format email tidak valid',
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(AppTextField),
        matchesGoldenFile('goldens/app_textfield_error_light.png'),
      );
    });
  });

  // ── AppCard ───────────────────────────────────────────────────────────────
  group('AppCard golden', () {
    testWidgets('elevated light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 280,
            child: AppCard(
              child: Text('Elevated Card Content'),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(AppCard),
        matchesGoldenFile('goldens/app_card_elevated_light.png'),
      );
    });

    testWidgets('outlined light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 280,
            child: AppCard.outlined(
              child: Text('Outlined Card Content'),
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(AppCard),
        matchesGoldenFile('goldens/app_card_outlined_light.png'),
      );
    });
  });

  // ── AppChip ───────────────────────────────────────────────────────────────
  group('AppChip golden', () {
    testWidgets('all variants light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: const [
              AppChip(label: 'Primary'),
              AppChip(label: 'Success', variant: AppChipVariant.success),
              AppChip(label: 'Warning', variant: AppChipVariant.warning),
              AppChip(label: 'Danger',  variant: AppChipVariant.danger),
              AppChip(label: 'Neutral', variant: AppChipVariant.neutral),
            ],
          ),
        ),
      );
      await expectLater(
        find.byType(Wrap),
        matchesGoldenFile('goldens/app_chip_all_variants_light.png'),
      );
    });
  });

  // ── AppEmptyState ─────────────────────────────────────────────────────────
  group('AppEmptyState golden', () {
    testWidgets('default light', (tester) async {
      await tester.pumpWidget(
        _wrap(
          const SizedBox(
            width: 360,
            child: AppEmptyState(
              icon: Icons.inbox_outlined,
              title: 'Tidak Ada Data',
              description: 'Belum ada konten untuk ditampilkan saat ini.',
              actionLabel: 'Muat Ulang',
              onAction: null,
            ),
          ),
        ),
      );
      await expectLater(
        find.byType(AppEmptyState),
        matchesGoldenFile('goldens/app_empty_state_light.png'),
      );
    });
  });
}
