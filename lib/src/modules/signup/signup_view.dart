import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';
import 'package:demo_provider_mvvm/src/locator.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';

class SignupView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(
          create: (context) =>
              SignUpViewModel(userService: locator<UserService>()),
        ),
        // Add any other providers you might need for this view
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Create new account'),
          ),
          body: Center(
            child: AuthForm(
              usernameController: _usernameController,
              passwordController: _passwordController,
              onPressed: () async {
                final signUpViewModel =
                    Provider.of<SignUpViewModel>(context, listen: false);
                SignUpResult result = await signUpViewModel.signUp(
                  _usernameController.text,
                  _passwordController.text,
                );

                if (result == SignUpResult.success) {
                  Navigator.pop(context);
                } else if (result == SignUpResult.usernameExists) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Sign Up Failed'),
                      content: Text('Username already exists.'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
              buttonText: 'Sign Up',
            ),
          ),
        );
      },
    );
  }
}
