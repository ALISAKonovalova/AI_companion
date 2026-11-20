import 'package:flutter/material.dart';

import 'register_screen.dart';
import 'login_screen.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor, // Серый фон
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Центрируем по вертикали
          children: [
            // Заголовок
            Text('AI Companion', style: AppTheme.titleStyle),
            const SizedBox(height: 60), // Отступ 60 пикселей
            // Кнопка "Зарегистрироваться"
            CustomButton(
              text: 'Зарегистрироваться',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RegisterScreen(),
                  ),
                );
              },
            ),

            const SizedBox(height: 20), // Отступ между кнопками
            // Кнопка "Войти"
            CustomButton(
              text: 'Войти',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
