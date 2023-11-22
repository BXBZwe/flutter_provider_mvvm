import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends ChangeNotifier {
  final UserService userService;

  ProfileViewModel({required this.userService});

  UserModel? _currentUser;

  UserModel? get currentUser => _currentUser;

  Future<void> loadCurrentUser(String username) async {
    _currentUser = await userService.getUserByUsername(username);
    notifyListeners();
  }

  Future<void> updateUserProfile(UserModel updatedUser) async {
    if (_currentUser != null) {
      await userService.updateUser(_currentUser!.username, updatedUser);
      _currentUser = updatedUser;
      notifyListeners();
    }
  }
}
