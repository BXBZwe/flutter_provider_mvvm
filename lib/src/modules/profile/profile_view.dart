import 'package:demo_provider_mvvm/src/data/models/user/user_model.dart';
import 'package:demo_provider_mvvm/src/data/services/user_service.dart';
import 'package:demo_provider_mvvm/src/modules/profile/profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  final TextEditingController _displayNameController = TextEditingController();

  ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileViewModel>(
          create: (context) => ProfileViewModel(
            userService: Provider.of<UserService>(context),
          ),
        ),
      ],
      child: Consumer<ProfileViewModel>(
        builder: (context, viewModel, child) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Profile'),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Username: ${viewModel.currentUser?.username ?? ""}'),
                  SizedBox(height: 20),
                  Text(
                      'Display Name: ${viewModel.currentUser?.displayName ?? ""}'),
                  TextField(
                    controller: _displayNameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your display name',
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      if (_displayNameController.text.isNotEmpty) {
                        await viewModel.updateUserProfile(
                          UserModel(
                            username: viewModel.currentUser!.username,
                            displayName: _displayNameController.text,
                            password: '',
                          ),
                        );
                        _displayNameController.clear();
                      }
                    },
                    child: Text('Update Profile'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
