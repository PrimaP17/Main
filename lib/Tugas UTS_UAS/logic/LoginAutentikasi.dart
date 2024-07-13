import 'package:shared_preferences/shared_preferences.dart';

class LoginAutentikasi {
  static const String _validNomorTelepon = "083198679654";

  Future<void> saveUserInfo(String nomorTelepon) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('nomorTelepon', nomorTelepon);
    await prefs.setString('lastLoginTime', DateTime.now().toIso8601String());
  }

  Future<bool> isLoggedInExpired() async {
    final prefs = await SharedPreferences.getInstance();
    final lastLoginTimeString = prefs.getString('lastLoginTime');

    if (lastLoginTimeString == null) {
      return true;
    }

    final lastLoginTime = DateTime.parse(lastLoginTimeString);
    final currentTime = DateTime.now();
    final difference = currentTime.difference(lastLoginTime);
    return difference.inMinutes > 5;
  }

  Future<bool> login(String nomorTelepon) async {
    if (nomorTelepon == _validNomorTelepon) {
      await saveUserInfo(nomorTelepon);
      return true;
    } else {
      return false;
    }
  }

  Future<String?> getUserInfo() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('nomorTelepon');
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('nomorTelepon');
  }
}
