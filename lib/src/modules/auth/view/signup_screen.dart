import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';
import 'package:demo_provider_mvvm/src/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignupScreen({Key? key}) : super(key: key);

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
            final viewModel =
                Provider.of<AuthViewModel>(context, listen: false);
            SignUpResult result = await viewModel.signUp(
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
  }
}
