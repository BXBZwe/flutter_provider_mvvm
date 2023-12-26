import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';
import 'package:demo_provider_mvvm/src/modules/profile/profile_view.dart';
import '../../mocks.mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:get_it/get_it.dart';

void main() {
  late MockAuthProvider mockAuthProvider;
  late MockThemeManager mockThemeManager;

  setUp(() {
    mockAuthProvider = MockAuthProvider();
    mockThemeManager = MockThemeManager();

    // Set up the expected behaviors of the mocks
    when(mockAuthProvider.setLoginStatus(any)).thenAnswer((_) async => true);
    when(mockThemeManager.toggle)
        .thenReturn(false); // assuming light mode initially
  });

  testWidgets('ProfileView should display user information and logout button',
      (WidgetTester tester) async {
    final testProfileView = ProfileView();
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>.value(value: mockAuthProvider),
          ChangeNotifierProvider<ThemeManager>.value(value: mockThemeManager),
        ],
        child: MaterialApp(home: testProfileView),
      ),
    );

    // Verify that certain widgets are present
    expect(find.text('John Doe'), findsOneWidget);
    expect(find.text('Software Developer'), findsOneWidget);
    expect(find.byType(CircleAvatar), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Optionally: Simulate interactions and verify outcomes
    // Example: Tapping the logout button
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();
    // Add assertions to verify the outcome of the logout action
  });

  tearDownAll(() {
    GetIt.instance.reset();
  });
}
