import 'package:final_project/consts/key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthProvider extends ChangeNotifier {
  final _secureStorage = const FlutterSecureStorage();
  String? _accessToken;
  String? _refreshToken;

  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;
  bool get isAuthenticated => _refreshToken != null;

  Future<void> initializeAuth() async {
    _refreshToken = await _secureStorage.read(key: REFRESH_TOKEN);
    notifyListeners();
  }

  Future<void> setTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    await _secureStorage.write(key: REFRESH_TOKEN, value: refreshToken);
    await _secureStorage.write(key: ACCESS_TOKEN, value: accessToken);

    _accessToken = accessToken;
    _refreshToken = refreshToken;
    notifyListeners();
  }

  Future<void> clearTokens() async {
    await _secureStorage.delete(key: REFRESH_TOKEN);
    await _secureStorage.delete(key: ACCESS_TOKEN);

    _accessToken = null;
    _refreshToken = null;
    notifyListeners();
  }
}
