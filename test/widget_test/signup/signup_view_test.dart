//import 'package:demo_provider_mvvm/src/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
//import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';
import 'package:get_it/get_it.dart';
//import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view.dart';
import 'package:demo_provider_mvvm/src/locator.dart';
//import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';
import '../../mocks.mocks.dart';

void main() {
  late MockSignUpViewModel mockSignUpViewModel;
  late MockUserService mockUserService;

  setUpAll(() {
    mockUserService = MockUserService();
    mockSignUpViewModel = MockSignUpViewModel();

    // Configure the mock before setting up the locator
    when(mockUserService.getUserByUsername(any)).thenAnswer((_) async => null);
    when(mockUserService.addUser(any)).thenAnswer((_) async => {});

    when(mockSignUpViewModel.signUp(any, any))
        .thenAnswer((_) async => SignUpResult.success);

    // Setup the locator with the mockUserService factory since mocks.mocks.dart cannt be directly imported in locator
    setupLocator(userServiceFactory: () => mockUserService);
    GetIt.instance.registerFactory<SignUpViewModel>(() => mockSignUpViewModel);
  });

  testWidgets(
    'Navigating from LoginView to SignupView and back to LoginView',
    (WidgetTester tester) async {
      // First, pump the LoginView widget since login is in navigation stack.
      await tester.pumpWidget(
        MaterialApp(
          home: LoginView(),
        ),
      );

      expect(find.byType(LoginView), findsOneWidget);

      //  simulating a user action that navigates to the SignupView.
      await tester.tap(find.byType(TextButton));
      await tester.pumpAndSettle();

      expect(find.byType(SignupView), findsOneWidget);

      await tester.pump(Duration(seconds: 1));
      await tester.enterText(find.byKey(Key('Username')), 'testuser');
      await tester.pump(Duration(seconds: 1));
      await tester.enterText(find.byKey(Key('Password')), 'testpassword');
      await tester.pump(Duration(seconds: 1));
      await tester.tap(find.byKey(Key('Auth')));
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 1));
      // Verify that after the sign-up process, we are back to the LoginView.
      expect(find.byType(LoginView), findsOneWidget);
    },
  );
  tearDownAll(() {
    GetIt.instance.unregister<SignUpViewModel>();
  });
}
