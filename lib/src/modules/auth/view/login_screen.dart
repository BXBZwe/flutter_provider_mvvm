import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/modules/auth/viewmodels/auth_viewmodel.dart';
import 'package:demo_provider_mvvm/src/modules/auth/view/signup_screen.dart';
import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';
import 'package:demo_provider_mvvm/src/modules/home/view/home_screen.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AuthForm(
              usernameController: _usernameController,
              passwordController: _passwordController,
              onPressed: () async {
                final viewModel =
                    Provider.of<AuthViewModel>(context, listen: false);
                bool success = await viewModel.login(
                  _usernameController.text,
                  _passwordController.text,
                );

                if (success) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Login Failed'),
                      content: Text('Invalid username or password.'),
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
              buttonText: 'Login',
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text('Don\'t have an account? Sign up here.'),
            ),
          ],
        ),
      ),
    );
  }
}
