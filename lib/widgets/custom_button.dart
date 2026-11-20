import 'package:flutter/material.dart';

import '../theme/app_theme.dart'; // Импортируем наши настройки

class CustomButton extends StatelessWidget {
  final String text; // Текст на кнопке
  final VoidCallback onPressed; // Что делать при нажатии

  // Конструктор: мы требуем передать текст и действие
  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250, // Фиксированная ширина кнопки
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
              AppTheme.primaryColor, // Берем цвет из настроек
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              15,
            ), // Закругленные углы
          ),
        ),
        child: Text(
          text,
          style: AppTheme.buttonTextStyle.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
