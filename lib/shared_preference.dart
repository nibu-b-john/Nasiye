import 'package:shared_preferences/shared_preferences.dart';

class Shared_Preferences {
  static late SharedPreferences _preferences;
  static const _keyToken = "token";
  static const _language = "language";
  static init() async {
    _preferences = await SharedPreferences.getInstance();
  }

// token
  static setToken(String token) async {
    await _preferences.setString(_keyToken, token);
  }

  static getToken() async {
    return _preferences.getString(_keyToken);
  }

// token
  static setLanguage(String language) async {
    await _preferences.setString(_language, language);
  }

  static getLanguage() async {
    return _preferences.getString(_language);
  }
}
