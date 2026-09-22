import 'package:flutter/material.dart';
import 'package:my_design_system/my_design_system.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  bool _isLoading = false;
  bool _chipSelected = false;
  String? _textFieldError;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('my_design_system Catalog'),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: widget.isDark ? 'Light mode' : 'Dark mode',
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          _sectionHeader(context, 'AppButton'),
          _buttonSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppTextField'),
          _textFieldSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppCard'),
          _cardSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppChip'),
          _chipSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppBadge'),
          _badgeSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppLoadingSkeleton'),
          _skeletonSection(),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppEmptyState'),
          AppEmptyState(
            icon: Icons.inbox_outlined,
            title: 'Tidak Ada Data',
            description: 'Belum ada konten untuk ditampilkan.',
            actionLabel: 'Muat Ulang',
            onAction: () {},
          ),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppErrorState'),
          AppErrorState(
            title: 'Gagal Memuat',
            description: 'Periksa koneksi internet kamu dan coba lagi.',
            onRetry: () {},
          ),
          const SizedBox(height: AppSpacing.xl),

          _sectionHeader(context, 'AppBottomSheet & AppSnackbar'),
          _overlaySection(),
          const SizedBox(height: AppSpacing.xxl),
        ],
      ),
    );
  }

  Widget _sectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppTextStyle.titleMd),
          const Divider(),
        ],
      ),
    );
  }

  // ── Button Section ────────────────────────────────────────────────────────
  Widget _buttonSection() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        AppButton(label: 'Primary', onPressed: () {}),
        AppButton.secondary(label: 'Secondary', onPressed: () {}),
        AppButton.ghost(label: 'Ghost', onPressed: () {}),
        AppButton.danger(label: 'Danger', onPressed: () {}),
        AppButton(label: 'Loading', onPressed: () {}, isLoading: _isLoading),
        AppButton(label: 'Disabled', onPressed: () {}, isDisabled: true),
        AppButton(
          label: 'Small',
          onPressed: () {},
          size: AppButtonSize.sm,
        ),
        AppButton(
          label: 'Large',
          onPressed: () {},
          size: AppButtonSize.lg,
        ),
        AppButton(
          label: 'With Icon',
          onPressed: () {},
          prefixIcon: const Icon(Icons.star),
        ),
        ElevatedButton(
          onPressed: () => setState(() => _isLoading = !_isLoading),
          child: Text(_isLoading ? 'Stop Loading' : 'Toggle Loading'),
        ),
      ],
    );
  }

  // ── TextField Section ─────────────────────────────────────────────────────
  Widget _textFieldSection() {
    return Column(
      children: [
        AppTextField(
          label: 'Email',
          hint: 'contoh@email.com',
          controller: _controller,
          prefixIcon: const Icon(Icons.email_outlined),
          onChanged: (v) => setState(() {
            _textFieldError =
                v.contains('@') ? null : 'Format email tidak valid';
          }),
          errorText: _textFieldError,
          helperText: 'Ketuk untuk mulai mengetik',
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          label: 'Password',
          hint: 'Min. 8 karakter',
          obscureText: true,
          prefixIcon: Icon(Icons.lock_outline),
          size: AppTextFieldSize.lg,
        ),
        const SizedBox(height: AppSpacing.md),
        const AppTextField(
          hint: 'Small size, no label',
          size: AppTextFieldSize.sm,
        ),
      ],
    );
  }

  // ── Card Section ──────────────────────────────────────────────────────────
  Widget _cardSection() {
    return Column(
      children: [
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Elevated Card', style: AppTextStyle.titleSm),
              const SizedBox(height: AppSpacing.xs),
              Text('Default card dengan shadow.', style: AppTextStyle.bodyMd),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard.outlined(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Outlined Card', style: AppTextStyle.titleSm),
              const SizedBox(height: AppSpacing.xs),
              Text('Card dengan border, tanpa shadow.', style: AppTextStyle.bodyMd),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        AppCard.filled(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Filled Card (tappable)', style: AppTextStyle.titleSm),
              const SizedBox(height: AppSpacing.xs),
              Text('Card dengan background filled + InkWell.', style: AppTextStyle.bodyMd),
            ],
          ),
        ),
      ],
    );
  }

  // ── Chip Section ──────────────────────────────────────────────────────────
  Widget _chipSection() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        AppChip(
          label: 'Flutter',
          selected: _chipSelected,
          onTap: () => setState(() => _chipSelected = !_chipSelected),
        ),
        const AppChip(label: 'Success', variant: AppChipVariant.success),
        const AppChip(label: 'Warning', variant: AppChipVariant.warning),
        const AppChip(label: 'Danger', variant: AppChipVariant.danger),
        AppChip(
          label: 'Hapus',
          variant: AppChipVariant.neutral,
          onDeleted: () {},
        ),
        const AppChip(label: 'Small', size: AppChipSize.sm),
        const AppChip(label: 'Large', size: AppChipSize.lg),
      ],
    );
  }

  // ── Badge Section ─────────────────────────────────────────────────────────
  Widget _badgeSection() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: const [
        AppBadge(label: 'Baru'),
        AppBadge(label: 'Promo', variant: AppBadgeVariant.success),
        AppBadge(label: '12', variant: AppBadgeVariant.danger),
        AppBadge(label: 'Info', variant: AppBadgeVariant.secondary),
        AppBadge(label: 'Warning', variant: AppBadgeVariant.warning),
        AppBadge(label: 'Netral', variant: AppBadgeVariant.neutral),
        AppBadge.dot(variant: AppBadgeVariant.success),
        AppBadge.dot(variant: AppBadgeVariant.danger),
        AppBadge(label: 'Small', size: AppBadgeSize.sm),
        AppBadge(label: 'Large', size: AppBadgeSize.lg),
      ],
    );
  }

  // ── Skeleton Section ──────────────────────────────────────────────────────
  Widget _skeletonSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const AppLoadingSkeleton.circle(size: 48),
            const SizedBox(width: AppSpacing.md),
            Expanded(child: AppSkeletonText(lines: 2)),
          ],
        ),
        const SizedBox(height: AppSpacing.md),
        const AppSkeletonCard(height: 100),
        const SizedBox(height: AppSpacing.md),
        AppSkeletonText(lines: 4, lastLineWidth: 0.5),
      ],
    );
  }

  // ── Overlay Section ───────────────────────────────────────────────────────
  Widget _overlaySection() {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: [
        AppButton(
          label: 'Show BottomSheet',
          onPressed: () => AppBottomSheet.show(
            context: context,
            title: 'Pilih Opsi',
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.edit),
                  title: const Text('Edit'),
                  onTap: () => Navigator.pop(context),
                ),
                ListTile(
                  leading: const Icon(Icons.delete_outline),
                  title: const Text('Hapus'),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
        AppButton.secondary(
          label: 'Snackbar Info',
          onPressed: () => AppSnackbar.show(
            context: context,
            message: 'Ini adalah snackbar info.',
          ),
        ),
        AppButton.secondary(
          label: 'Snackbar Success',
          onPressed: () => AppSnackbar.show(
            context: context,
            message: 'Data berhasil disimpan!',
            variant: AppSnackbarVariant.success,
          ),
        ),
        AppButton.danger(
          label: 'Snackbar Error',
          onPressed: () => AppSnackbar.show(
            context: context,
            message: 'Gagal memuat data. Coba lagi.',
            variant: AppSnackbarVariant.error,
            actionLabel: 'Retry',
          ),
        ),
      ],
    );
  }
}
