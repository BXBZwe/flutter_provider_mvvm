import 'package:demo_provider_mvvm/src/data/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AuthViewModel extends ChangeNotifier {
  final Box<UserModel> _userBox = Hive.box<UserModel>('userBox');

  UserModel? _currentUser;

  bool get isLogin => _currentUser != null;

  Future<bool> login(String username, String password) async {
    UserModel? user = _userBox.get(username);

    if (user != null && user.password == password) {
      _currentUser = user;
      notifyListeners();
      return true; // Successful login
    } else {
      return false; // Failed login
    }
  }

  Future<SignUpResult> signUp(String username, String password) async {
    if (_userBox.containsKey(username)) {
      return SignUpResult.usernameExists; // Username already exists
    } else {
      _userBox.put(username, UserModel(username: username, password: password));
      notifyListeners();
      return SignUpResult.success; // Successful signup
    }
  }

  Future<bool> isLoggedIn() async {
    return _currentUser != null;
  }

  UserModel? getCurrentUser() {
    return _currentUser;
  }
}

enum SignUpResult {
  success,
  usernameExists,
}
