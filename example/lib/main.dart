import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'my_design_system — Catalog',
      home: Scaffold(
        appBar: AppBar(title: const Text('my_design_system')),
        body: const Center(
          child: Text(
            'Catalog coming in PR 12!',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}

