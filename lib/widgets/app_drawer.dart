import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import '../services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onCreateCharacter; // Функция, которая сработает при нажатии на кнопку "Создать персонажа"
  final VoidCallback onLogout; // Функция для выхода

  const AppDrawer({
    super.key,
    required this.onCreateCharacter,
    required this.onLogout,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Шапка профиля
          FutureBuilder<String?>(
            future: AuthService.getUserEmail(),
            builder: (context, snapshot) {
              final email = snapshot.data ?? 'user@mail.ru';
              return UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: AppTheme.primaryColor,
                ),
                accountName: const Text(
                  'Мой профиль', // Ник (пока статичный)
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                accountEmail: Text(email),
                currentAccountPicture: const CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person,
                    size: 40,
                    color: AppTheme.primaryColor,
                  ),
                ),
                // Кнопка с тремя точками (выход)
                otherAccountsPictures: [
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                    ),
                    onPressed: onLogout,
                    tooltip: 'Выйти',
                  ),
                ],
              );
            },
          ),

          // Кнопка создания персонажа
          ListTile(
            leading: const Icon(
              Icons.add_circle_outline,
              color: AppTheme.primaryColor,
            ),
            title: const Text(
              'Создать персонажа',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            onTap: onCreateCharacter,
          ),

          const Divider(),
        ],
      ),
    );
  }
}
