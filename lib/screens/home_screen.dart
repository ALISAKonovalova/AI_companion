import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../widgets/app_drawer.dart';
import '../services/auth_service.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Тут потом будут храниться твои персонажи
  List<Map<String, String>> _characters = [];

  // Функция выхода
  void _logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    if (context.mounted) {
      Navigator.pushReplacementNamed(context, '/');
    }
  }

  // Функция создания персонажа (пока заглушка)
  void _createCharacter() {
    Navigator.pop(context); // Закрываем панель
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Скоро здесь будет создание персонажа!'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        title: const Text('AI Companion'),
        backgroundColor: AppTheme.backgroundColor,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      // Подключаем боковую панель с профилем и кнопкой
      drawer: AppDrawer(
        onCreateCharacter: _createCharacter,
        onLogout: () => _logout(context),
      ),
      // Основное место (справа) для персонажей
      body: _characters.isEmpty
          ? const Center(
              child: Text(
                'У тебя пока нет персонажей.\nНажми на меню слева, чтобы создать!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
            )
          : ListView.builder(
              scrollDirection:
                  Axis.horizontal, // <- Вот тут они будут в строчку!
              padding: const EdgeInsets.all(16),
              itemCount: _characters.length,
              itemBuilder: (context, index) {
                final char = _characters[index];
                return Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        radius: 30,
                        backgroundColor: AppTheme.primaryColor,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        char['name']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        char['personality']!,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
