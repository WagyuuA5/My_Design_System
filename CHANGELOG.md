# Changelog

All notable changes to `my_design_system` will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-09-22

*Rilis pertama package my_design_system.*

### Added
- Initial package scaffolding with `lib/src/{tokens,theme,components}/` structure
- Barrel file `lib/my_design_system.dart`
- Example app scaffold with path dependency on parent package
- MIT license, CHANGELOG, and standard Flutter package `.gitignore`
- `AppColors` â€” primary (Indigo), secondary (Teal), semantic (success/warning/error/info), neutral scale 50â€“900
- `AppSpacing` â€” 4px-grid scale: xs(4), sm(8), md(12), lg(16), xl(24), xxl(32), xxxl(48), huge(64)
- `AppRadius` â€” none, sm(4), md(8), lg(12), xl(16), xxl(24), full(999)
- `AppElevation` â€” none, sm(1), md(3), lg(6), xl(12), xxl(24)
- `AppDuration` — fast(100ms), normal(200ms), slow(300ms), emphasis(500ms), shimmer(1500ms)
- `AppTheme.light` / `AppTheme.dark` — ThemeData built from all tokens; `AppColorsExtension` ThemeExtension for semantic colors
- `AppTextStyle` — typography scale: display/headline/title/body/label, each lg/md/sm, using Inter via google_fonts
- `AppTextStyle.textTheme` — TextTheme helper for use in ThemeData (PR 4)

- `AppButton` — variant: primary/secondary/ghost/danger; size: sm/md/lg; state: loading, disabled; optional prefix/suffix icon
- `AppTextField` — label, hint, helperText, errorText (error state), size: sm/md/lg, prefix/suffix icon & text
- `AppCard` — variant: elevated/outlined/filled; size: sm/md/lg; optional onTap/onLongPress with InkWell
- `AppChip` — variant: primary/secondary/neutral/success/warning/danger; size: sm/md/lg; selectable, deletable
- `AppBadge` — same variant/size pattern; dot variant (no label) supported
- `AppEmptyState` — icon/illustration, title, description, primary + secondary action button
- `AppErrorState` — same structure as AppEmptyState with danger retry button and error icon default
- `AppLoadingSkeleton` — shimmer animation, shapes: rectangle/circle/pill; helper widgets: `AppSkeletonText`, `AppSkeletonCard`
- `AppBottomSheet.show()` — static helper, DraggableScrollableSheet, optional title/subtitle, drag handle
- `AppSnackbar.show()` — static helper, variant: info/success/warning/error, optional action
- Halaman Catalog di `example/` — menampilkan semua komponen, dikelompokkan per kategori, dengan toggle light/dark di AppBar
- Golden tests untuk AppButton (3 kasus), AppTextField (2), AppCard (2), AppChip (1), AppEmptyState (1) — 9 total; file di `test/goldens/`; di-generate di Windows 11 + Flutter 3.38.3
- `.github/workflows/ci.yml` — CI pipeline: flutter analyze + flutter test (termasuk golden) pada setiap PR ke main; runner windows-latest (konsisten dengan platform generate golden)


