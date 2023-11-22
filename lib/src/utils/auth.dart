import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AuthProvider extends ChangeNotifier {
  bool _isLoggedIn = false;

  AuthProvider() {
    _init();
  }

  bool get isLoggedIn => _isLoggedIn;

  Future<void> _init() async {
    final Box<bool> loginBox = await Hive.openBox<bool>('loginBox');
    bool? storedLoginStatus = loginBox.get('isLogin');

    if (storedLoginStatus != null && storedLoginStatus) {
      _isLoggedIn = true;
    } else {
      _isLoggedIn = false;
    }

    notifyListeners();
  }

  Future<void> setLoginStatus(bool isLoggedIn) async {
    final Box<bool> loginBox = await Hive.openBox<bool>('loginBox');

    _isLoggedIn = isLoggedIn;
    loginBox.put('isLogin', isLoggedIn);

    notifyListeners();
  }

  Future<bool> checkIsLoggedIn() async {
    return isLoggedIn;
  }
}
