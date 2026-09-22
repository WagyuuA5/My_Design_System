import 'package:flutter/material.dart';
import 'package:my_design_system/my_design_system.dart';

import 'catalog_page.dart';

void main() {
  runApp(const CatalogApp());
}

class CatalogApp extends StatefulWidget {
  const CatalogApp({super.key});

  @override
  State<CatalogApp> createState() => _CatalogAppState();
}

class _CatalogAppState extends State<CatalogApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_design_system — Catalog',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: _themeMode,
      home: CatalogPage(
        isDark: _themeMode == ThemeMode.dark,
        onToggleTheme: _toggleTheme,
      ),
    );
  }
}
