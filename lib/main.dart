import 'package:demo_provider_mvvm/src/app.dart';
import 'package:demo_provider_mvvm/src/common/global.dart';
import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

globalInitializer() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await Hive.initFlutter();
    await Hive.openBox(boxName);
    Hive.registerAdapter(UserModelAdapter());
  } catch (error) {
    // print('Error initializing Hive: $error');
  }
}

void main() async {
  await globalInitializer();

  runApp(const App());
}
