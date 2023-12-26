import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:demo_provider_mvvm/src/utils/auth.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
            key: Key('themeToggleButton'),
            icon: Icon(
              Provider.of<ThemeManager>(context).toggle
                  ? Icons.light_mode
                  : Icons.nightlight_round,
            ),
            onPressed: () {
              Provider.of<ThemeManager>(context, listen: false).setDark(
                !Provider.of<ThemeManager>(context, listen: false).toggle,
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/images/Funny-Cat-Hidden.jpg'),
            ),
            SizedBox(height: 20),
            Text(
              'John Doe',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Software Developer',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('john.doe@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('+1 (123) 456-7890'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Implement logout functionality
                // For example, you can use Navigator to navigate to the login screen
                await Provider.of<AuthProvider>(context, listen: false)
                    .setLoginStatus(false);
                Navigator.of(context).pop();
              },
              child: Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
