import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view_model.dart';

class SignupView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Center(
          child: AuthForm(
            usernameController: _usernameController,
            passwordController: _passwordController,
            onPressed: () async {
              final signUpViewModel = Provider.of<SignUpViewModel>(context,
                  listen:
                      false); // Fix: Use SignUpViewModel instead of SignUpProvider
              SignUpResult result = await signUpViewModel.signUp(
                // Fix: Use signUpViewModel instead of signUpProvider
                _usernameController.text,
                _passwordController.text,
              );

              if (result == SignUpResult.success) {
                // Handle successful signup, e.g., navigate to a different screen
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
        ));
  }
}
