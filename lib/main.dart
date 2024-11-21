import 'package:flutter/material.dart';
import 'package:generic_bottom_sheet_selector/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      showSemanticsDebugger: false,
      home: HomePage(),
    );
  }
}
