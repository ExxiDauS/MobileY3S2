import 'package:flutter/material.dart';
import 'package:mobile_mid_mock/screen/main_screen.dart';

void main() async {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
