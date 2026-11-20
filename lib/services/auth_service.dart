import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // Сохранение данных пользователя при регистрации
  static Future<void> saveUser(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
    await prefs.setString('user_password', password);
  }

  // Получить сохраненный email
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance(); 
    return prefs.getString('user_email');
  }

  // Проверка, есть ли уже зарегистрированный пользователь
  static Future<String?> getSavedEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('user_email');
  }

  // Проверка пароля при входе
  static Future<bool> checkLogin(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedEmail = prefs.getString('user_email');
    final savedPassword = prefs.getString('user_password');

    if (savedEmail == email && savedPassword == password) {
      return true; // Данные совпадают
    }
    return false; // Неверный логин или пароль
  }
}