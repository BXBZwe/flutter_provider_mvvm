import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view_model.dart';
import '../../mocks.mocks.dart';
import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';

void main() {
  late MockUserService mockUserService;
  late LoginViewModel loginViewModel;

  setUp(() {
    mockUserService = MockUserService();
    loginViewModel = LoginViewModel(userService: mockUserService);
  });

  group('LoginViewModel', () {
    test('Successful login', () async {
      when(mockUserService.getUserByUsername('validUser')).thenAnswer(
          (_) async =>
              UserModel(username: 'validUser', password: 'validPassword'));

      when(mockUserService.setCurrentUser('validUser'))
          .thenAnswer((_) async {});

      bool result = await loginViewModel.login('validUser', 'validPassword');
      expect(result, true);
    });

    test('Failed login due to wrong password', () async {
      when(mockUserService.getUserByUsername('validUser')).thenAnswer(
          (_) async =>
              UserModel(username: 'validUser', password: 'validPassword'));

      bool result = await loginViewModel.login('validUser', 'wrongPassword');
      expect(result, false);
    });

    test('Failed login due to non-existing user', () async {
      when(mockUserService.getUserByUsername('nonExistingUser'))
          .thenAnswer((_) async => null);

      bool result =
          await loginViewModel.login('nonExistingUser', 'anyPassword');
      expect(result, false);
    });
  });
}
