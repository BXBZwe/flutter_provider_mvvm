import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view.dart';
import '../../mocks.mocks.dart'; // Import your mocks
import 'package:demo_provider_mvvm/src/utils/auth.dart';
import 'package:demo_provider_mvvm/src/locator.dart';
//import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
//import 'package:mockito/mockito.dart';
//import 'package:path_provider/path_provider.dart' as path_provider;
//import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';

//class MockPathProviderPlatform extends Mock implements PathProviderPlatform {}

void main() {
  late MockAuthProvider mockAuthProvider;

  setUp(() async {
    //PathProviderPlatform.instance = MockPathProviderPlatform();

    Directory tempDir = Directory.current;
    Hive.init(tempDir.path);
    mockAuthProvider = MockAuthProvider();
    setupLocator();
  });

  testWidgets('LoginView will be displaying the home page.',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<AuthProvider>(
          create: (_) => mockAuthProvider,
          child: LoginView(),
        ),
      ),
    );

    await tester.pumpAndSettle();
    await tester.pump(Duration(seconds: 2));

    expect(find.byType(LoginView), findsOneWidget);

    // Simulate user input
    await tester.enterText(find.byKey(Key('Username')), 'BXBZwe');
    await tester.enterText(find.byKey(Key('Password')), 'BXBZwe136928');

    // Simulate login button tap
    final Finder loginButton = find.byKey(Key('Auth'));
    await tester.tap(loginButton);

    await tester.pump(Duration(seconds: 2));
  });

  tearDownAll(() async {
    //GetIt.instance.reset();
    await Hive.close();
    //PathProviderPlatform.instance = null;
  });
}
