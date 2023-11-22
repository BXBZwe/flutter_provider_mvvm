import 'package:demo_provider_mvvm/src/common/global.dart';
import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserService {
  Future<void> setCurrentUser(String username) async {}

  Future<void> addUser(UserModel user) async {
    var userBox = await Hive.openBox<UserModel>(userDB);
    await userBox.add(user);
  }

  Future<List<UserModel>> getAllUsers() async {
    var userBox = await Hive.openBox<UserModel>(userDB);
    var users = userBox.values.toList();
    return users;
  }

  Future<UserModel?> getUserByUsername(
    String username,
  ) async {
    var userBox = await Hive.openBox<UserModel>(userDB);
    var users =
        userBox.values.where((user) => user.username == username).toList();
    return users.isNotEmpty ? users.first : null;
  }

  Future<void> updateUser(String username, UserModel updatedUser) async {
    var userBox = await Hive.openBox<UserModel>(userDB);
    var user = await getUserByUsername(username);
    if (user != null) {
      var index = userBox.keyAt(user as int);
      await userBox.putAt(index, updatedUser);
    }
  }

  Future<void> deleteUser(String username) async {
    var userBox = await Hive.openBox<UserModel>(userDB);
    var user = await getUserByUsername(username);
    if (user != null) {
      await userBox.delete(user.key);
    }
  }
}
