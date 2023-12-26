import 'package:demo_provider_mvvm/src/modules/profile/profile_view.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
//import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view.dart';
import 'package:demo_provider_mvvm/src/modules/home/home_view.dart';
//import 'package:demo_provider_mvvm/src/app.dart';
import 'package:demo_provider_mvvm/main.dart' as app;
import 'package:demo_provider_mvvm/src/modules/signup/signup_view.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('User Flow Integration Test', () {
    testWidgets('Full user flow from signup to logout', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));
      // final Finder signUpButton = find.byKey(Key('signupButton'));
      //await tester.tap(find.byKey(Key('signupButton')));
      //await tester.pumpAndSettle();

      expect(find.byType(LoginView), findsOneWidget);

      //print(find.byType(LoginView).evaluate().single.widget.toStringDeep());

      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(SignupView), findsOneWidget);

      // Sign up process
      await tester.enterText(find.byKey(Key('Username')), 'BXBZwe');
      await tester.enterText(find.byKey(Key('Password')), 'BXBZwe136928');
      final Finder signUpSubmitButton = find.text('Sign Up');
      await tester.tap(signUpSubmitButton);
      await tester.pumpAndSettle();

      // Login with new credentials
      await tester.enterText(find.byKey(Key('Username')), 'BXBZwe');
      await tester.enterText(find.byKey(Key('Password')), 'BXBZwe136928');
      final Finder loginButton = find.text('Login');
      await tester.tap(loginButton);
      await tester.pumpAndSettle();

      await tester.pump(Duration(seconds: 2));

      // Verify home page is displayed
      expect(find.byType(HomeView), findsOneWidget); // Use appropriate finder

      // Navigate to profile page
      // ... Add navigation to profile page and perform actions
      await tester.pump(Duration(seconds: 2));

      expect(find.byIcon(Icons.person), findsOneWidget);

      await tester.tap(find.byIcon(Icons.person));
      await tester.pumpAndSettle();

      expect(find.byType(ProfileView), findsOneWidget);
      await tester.pump(Duration(seconds: 2));

      // Interact with profile page, e.g., change theme
      final Finder themeToggleButton = find.byKey(Key('themeToggleButton'));
      await tester.tap(themeToggleButton);
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));

      // Log out
      final Finder logoutButton = find.text('Logout');
      await tester.tap(logoutButton);
      await tester.pumpAndSettle();

      // Verify redirected back to login page
      expect(find.byType(LoginView), findsOneWidget); // Use appropriate finder
    });
  });
}
