import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ChangeNotifier {
  late UserService _userService;

  LoginViewModel() {
    _userService = UserService();
  }

  Future<bool> login(
      BuildContext context, String username, String password) async {
    UserModel? user = await _userService.getUserByUsername(username);

    if (user != null && user.password == password) {
      // Update the current user key in the UserService
      await _userService.setCurrentUser(username);

      return true; // Successful login
    } else {
      return false; // Failed login
    }
  }
}
