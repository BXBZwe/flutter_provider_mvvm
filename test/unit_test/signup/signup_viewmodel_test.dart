import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';
import '../../mocks.mocks.dart';
import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';

void main() {
  late MockUserService mockUserService;
  late SignUpViewModel signUpViewModel;

  setUp(() {
    mockUserService = MockUserService();
    signUpViewModel = SignUpViewModel(userService: mockUserService);
  });

  test('Successful sign up', () async {
    when(mockUserService.getUserByUsername(any)).thenAnswer((_) async => null);

    final result = await signUpViewModel.signUp('zwe', 'zweincrying');

    expect(result, SignUpResult.success);
    verify(mockUserService.addUser(any)).called(1);
  });

  test('Username exists', () async {
    when(mockUserService.getUserByUsername(any)).thenAnswer(
        (_) async => UserModel(username: 'existinguser', password: 'password'));

    final result = await signUpViewModel.signUp('existinguser', 'password');

    expect(result, SignUpResult.usernameExists);
    verifyNever(mockUserService.addUser(any));
  });
}
