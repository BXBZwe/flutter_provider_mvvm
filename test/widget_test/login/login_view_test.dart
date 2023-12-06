import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
//import 'package:demo_provider_mvvm/src/modules/login/login_view.dart';
//import 'package:demo_provider_mvvm/src/modules/home/home_view.dart';
import '../../mocks.mocks.dart';
import 'package:get_it/get_it.dart';
//import 'package:demo_provider_mvvm/src/modules/login/login_view_model.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';
//import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
//import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
//import 'package:demo_provider_mvvm/src/routes.dart';
//import 'package:demo_provider_mvvm/src/app.dart';
import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:demo_provider_mvvm/src/modules/profile/profile_view.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

void main() {
  late MockAuthProvider mockAuthProvider;
  late MockThemeManager mockThemeManager;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
    mockThemeManager = MockThemeManager();

    // Mock the behaviors of AuthProvider and ThemeManager
    // (Your existing mock setups)
  });

  testWidgets(
      'ProfileView should display user information, logout button, and support theme toggle',
      (WidgetTester tester) async {
    // Set initial theme to light mode
    when(mockThemeManager.toggle).thenReturn(false);

    final mockObserver = MockNavigatorObserver();
    when(mockAuthProvider.setLoginStatus(any)).thenAnswer((_) async {});
    when(mockAuthProvider.isLoggedIn).thenReturn(false);
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
          ChangeNotifierProvider<ThemeManager>.value(value: mockThemeManager),
        ],
        child: MaterialApp(
          home: ProfileView(),
          navigatorObservers: [mockObserver],
        ),
      ),
    );

    // Verify initial state (light mode)
    // (Your existing verifications)
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Software Developer'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
    // Simulate theme change to dark mode
    when(mockThemeManager.toggle).thenReturn(true);
    // You need to trigger a rebuild of the widget after changing the theme
    mockThemeManager.notifyListeners();
    await tester.pumpAndSettle();
    verify(mockAuthProvider.setLoginStatus(false)).called(1);
    expect(mockAuthProvider.isLoggedIn, isFalse);
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });
}
