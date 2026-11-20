import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Companion',
      debugShowCheckedModeBanner:
          false, // Убирает красную ленточку "DEBUG" в углу
      home: const WelcomeScreen(), // Запускаем наш экран приветствия
    );
  }
}
