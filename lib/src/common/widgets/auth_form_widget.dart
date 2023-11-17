import 'package:demo_provider_mvvm/src/common/theme/app_theme.dart';
import 'package:demo_provider_mvvm/src/common/theme/app_typography.dart';
import 'package:flutter/material.dart';

class AuthForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final VoidCallback onPressed;
  final String buttonText;

  AuthForm({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: usernameController,
            style: AppTypography.body,
            decoration: InputDecoration(
              labelText: 'Username',
              labelStyle: AppTypography.body,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.iris),
              ),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: passwordController,
            style: AppTypography.body,
            decoration: InputDecoration(
              labelText: 'Password',
              labelStyle: AppTypography.body,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.iris),
              ),
            ),
            obscureText: true,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.fuschia,
              textStyle: AppTypography.buttonText,
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
