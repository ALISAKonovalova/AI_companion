import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/custom_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Контроллеры нужны, чтобы забирать текст, который ввел пользователь
  final TextEditingController _emailController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      // Кнопка "Назад" появляется автоматически, так как мы перешли с другого экрана
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        elevation: 0, // Убирает тень под верхней панелью
        iconTheme: const IconThemeData(
          color: Color.fromARGB(221, 251, 250, 250),
        ), // Цвет стрелочки "назад"
      ),
      body: Center(
        child: SingleChildScrollView(
          // Чтобы экран можно было прокрутить, если клавиатура перекроет поля
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Регистрация', style: AppTheme.titleStyle),
              const SizedBox(height: 40),

              // Поле для ввода почты
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Поле для ввода пароля
              TextField(
                controller: _passwordController,
                obscureText: true, // Скрывает символы пароля точками
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 40),

              // Наша красивая кнопка
              CustomButton(
                text: 'Зарегистрироваться',
                onPressed: () {
                  // Пока просто выводим то, что ввели, в консоль
                  print('Email: ${_emailController.text}');
                  print('Пароль: ${_passwordController.text}');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
