# my_design_system

[![CI](https://github.com/WagyuuA5/My_Design_System/actions/workflows/ci.yml/badge.svg)](https://github.com/WagyuuA5/My_Design_System/actions/workflows/ci.yml)
![Flutter](https://img.shields.io/badge/Flutter-3.38.x-blue?logo=flutter)
![Version](https://img.shields.io/badge/version-0.1.0-green)
![License](https://img.shields.io/badge/license-MIT-blue)

> **Satu design system, semua showcase app terlihat konsisten.**

Package Flutter yang dipakai ulang di semua app portofolio:
**Furniture_App**, **Ovo_Clone_App**, **PDAM_App**, dan lainnya.

---

## Komponen

| Komponen | Deskripsi |
|----------|-----------|
| `AppButton` | primary / secondary / ghost / danger · sm/md/lg · loading · disabled |
| `AppTextField` | label · error state · helper text · sm/md/lg |
| `AppCard` | elevated / outlined / filled · sm/md/lg · tappable |
| `AppChip` | 6 variant warna · sm/md/lg · selectable · deletable |
| `AppBadge` | 6 variant warna · sm/md/lg · dot variant |
| `AppEmptyState` | icon/illustration · title · description · action |
| `AppErrorState` | error icon · retry button · secondary action |
| `AppLoadingSkeleton` | shimmer · rectangle/circle/pill · `AppSkeletonText` · `AppSkeletonCard` |
| `AppBottomSheet` | static helper · DraggableScrollableSheet · title/subtitle |
| `AppSnackbar` | static helper · info/success/warning/error · action label |

---

## Screenshot

> **📸 Screenshot halaman Catalog belum tersedia.**
> Untuk mengambil screenshot sungguhan:
> 1. `cd example && flutter run`
> 2. Screenshot di emulator/device
> 3. Simpan di `docs/screenshots/` dan update README ini

---

## Instalasi

### Path Dependency (development lokal)

Gunakan ini saat kamu mengembangkan showcase app dan design system di mesin yang sama:

```yaml
# di pubspec.yaml app kamu (misal Furniture_App/pubspec.yaml)
dependencies:
  my_design_system:
    path: ../My_Design_System   # relatif dari folder app kamu ke folder package ini
```

### Git Dependency (repo showcase terpisah)

Gunakan ini saat app showcase di-clone dari repo berbeda (misalnya di CI, atau di mesin lain):

```yaml
# di pubspec.yaml app kamu
dependencies:
  my_design_system:
    git:
      url: https://github.com/WagyuuA5/My_Design_System.git
      ref: main   # atau pin ke tag/commit tertentu, misal: ref: v0.1.0
```

> **Tip:** Saat API sudah stabil, pin ke tag versi (`ref: v0.1.0`) agar app showcase tidak tiba-tiba rusak saat design system diupdate.

### Import di kode Dart

```dart
import 'package:my_design_system/my_design_system.dart';
```

### Setup tema di MaterialApp

```dart
MaterialApp(
  theme: AppTheme.light,
  darkTheme: AppTheme.dark,
  themeMode: ThemeMode.system, // atau .light / .dark
  // ...
)
```

---

## Testing

### Menjalankan semua test

```bash
flutter test
```

### Menjalankan golden test saja

```bash
flutter test test/golden_test.dart
```

### Regenerasi golden file

> ⚠️ **Platform penting:** Golden file di `test/goldens/` di-generate di
> **Windows 11 + Flutter 3.38.3 (Dart 3.10.1)**. Jika kamu menjalankan
> `--update-goldens` di platform lain (Linux/macOS), hasil rendering bisa
> berbeda karena perbedaan font rasterization. Golden file yang ada di repo
> adalah referensi untuk Windows. Ini bukan bug.

```bash
# Jalankan di Windows dengan Flutter 3.38.3
flutter test test/golden_test.dart --update-goldens
git add test/goldens/
git commit -m "test(golden): regenerate golden files on Windows + Flutter 3.38.3"
```

---

## Catalog App

Untuk melihat semua komponen sekaligus:

```bash
cd example
flutter run
```

Halaman Catalog menampilkan semua komponen dikelompokkan per kategori,
dengan toggle light/dark di AppBar.

---

## Versioning

Package ini mengikuti **Semantic Versioning**:

- **MAJOR** — breaking change API (misal: rename parameter, hapus komponen)
- **MINOR** — fitur baru tanpa breaking change (misal: tambah komponen baru)
- **PATCH** — bugfix, perbaikan minor (misal: fix rendering, fix typo)

**Versi saat ini: `0.1.0`**

Karena ini versi `0.x.x`, API masih bisa berubah tanpa jaminan backward compatibility penuh.
Saat semua app showcase sudah menggunakan package ini dan API dinyatakan stabil,
versi akan di-bump ke `1.0.0`.

Lihat [CHANGELOG.md](CHANGELOG.md) untuk detail perubahan per PR.

---

## Lisensi

MIT © 2026 [WagyuuA5](https://github.com/WagyuuA5)
