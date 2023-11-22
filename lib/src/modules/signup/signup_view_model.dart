import 'package:demo_provider_mvvm/src/data/models/user_model.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:flutter/material.dart';

enum SignUpResult {
  success,
  usernameExists,
}

class SignUpViewModel extends ChangeNotifier {
  late UserService _userService;

  SignUpViewModel() {
    _userService = UserService();
  }

  Future<SignUpResult> signUp(String username, String password) async {
    UserModel? existingUser = await _userService.getUserByUsername(username);

    if (existingUser != null) {
      notifyListeners();
      return SignUpResult.usernameExists; // Username already exists
    } else {
      await _userService
          .addUser(UserModel(username: username, password: password));
      notifyListeners();
      return SignUpResult.success; // Successful signup
    }
  }
}
