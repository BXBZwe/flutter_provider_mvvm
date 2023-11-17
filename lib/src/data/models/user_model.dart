import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 32) // Make sure this typeId matches the one in the error
class UserModel extends HiveObject {
  @HiveField(0)
  late String username;

  @HiveField(1)
  late String password;

  @HiveField(2)
  String? fullName;

  @HiveField(3)
  String? email;

  UserModel({
    required this.username,
    required this.password,
    this.fullName,
    this.email,
  });
}
