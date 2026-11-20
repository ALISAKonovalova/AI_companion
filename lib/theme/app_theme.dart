import 'package:flutter/material.dart';

// Класс, где хранятся цвета и стили
class AppTheme {
  // Цвет фона
  static const Color backgroundColor = Color.fromARGB(
    255,
    132,
    129,
    129,
  );

  // Главный цвет приложения
  static const Color primaryColor = Color.fromARGB(255, 113, 53, 217);

  // Стиль для заголовков
  static const TextStyle titleStyle = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(221, 255, 255, 255),
  );

  // Стиль для текста на кнопках
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
}
