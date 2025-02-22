import 'dart:convert';

import 'package:go_green/Data/Models/auth/user_model.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static const String _tokenKey = 'auth_token';
  static const String _userDataKey = 'user_data';

  static SharedPrefManager? _instance;
  static SharedPreferences? _prefs;

  SharedPrefManager._();

  static Future<SharedPrefManager> getInstance() async {
    if (_instance == null) {
      _instance = SharedPrefManager._();
      _prefs = await SharedPreferences.getInstance();
    }
    return _instance!;
  }

  // Save user data and token
  Future<bool> saveUserSession(User user) async {
    if (user.token == null) return false;

    await _prefs?.setString(_tokenKey, user.token!);
    await _prefs?.setString(_userDataKey, jsonEncode(user.toJson()));
    return true;
  }

  // Get stored token
  String? getToken() {
    return _prefs?.getString(_tokenKey);
  }

  // Get stored user data
  User? getUser() {
    final userStr = _prefs?.getString(_userDataKey);
    if (userStr == null) return null;

    try {
      return User.fromJson(jsonDecode(userStr));
    } catch (e) {
      return null;
    }
  }

  // Check if token is valid
  bool isTokenValid() {
    final token = getToken();
    if (token == null) return false;

    try {
      // Check if token is expired
      return !JwtDecoder.isExpired(token);
    } catch (e) {
      return false;
    }
  }

  // Clear stored data
  Future<void> clearSession() async {
    await _prefs?.remove(_tokenKey);
    await _prefs?.remove(_userDataKey);
  }
}
