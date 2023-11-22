import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';
import 'package:demo_provider_mvvm/src/modules/login/login_view_model.dart';
import 'package:demo_provider_mvvm/src/modules/signup/signup_view.dart';
import 'package:demo_provider_mvvm/src/common/widgets/auth_form_widget.dart';

class LoginView extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginViewModel>(
          create: (context) => LoginViewModel(),
        ),
      ],
      builder: (context, child) {
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
                    final authProvider =
                        Provider.of<AuthProvider>(context, listen: false);

                    final viewModel =
                        Provider.of<LoginViewModel>(context, listen: false);
                    bool success = await viewModel.login(
                      context,
                      _usernameController.text,
                      _passwordController.text,
                    );

                    if (success) {
                      await authProvider.setLoginStatus(true);
                      // Navigator.pushReplacementNamed(context, '/');
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
                      MaterialPageRoute(builder: (context) => SignupView()),
                    );
                  },
                  child: Text('Don\'t have an account? Sign up here.'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
