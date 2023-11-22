// import 'package:demo_provider_mvvm/src/common/app_config.dart';
// import 'package:demo_provider_mvvm/src/common/theme/app_typography.dart';
// import 'package:demo_provider_mvvm/src/modules/auth/viewmodels/auth_viewmodel.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:demo_provider_mvvm/src/common/theme/app_theme.dart';

// class ProfileView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = Provider.of<AuthViewModel>(context);
//     var themeManager = Provider.of<ThemeManager>(context);
//     final user = viewModel.getCurrentUser();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.brightness_6),
//             onPressed: () {
//               themeManager.setDark(!themeManager.toggle);
//             },
//           ),
//         ],
//       ),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CircleAvatar(
//                 radius: 50,
//                 backgroundImage: NetworkImage(
//                   'https://placekitten.com/200/200',
//                 ),
//               ),
//               SizedBox(height: 20),
//               Text(
//                 'Username: ${user?.username ?? ''}',
//                 style: AppTypography.subtitle,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Full Name: ${user?.fullName ?? ''}',
//                 style: AppTypography.subtitle,
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Email: ${user?.email ?? ''}',
//                 style: AppTypography.subtitle,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add functionality to edit profile
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppTheme.fuschia,
//                 ),
//                 child: Text(
//                   'Edit Profile',
//                   style: AppTypography.buttonText,
//                 ),
//               ),
//               SizedBox(height: 10),
//               ElevatedButton(
//                 onPressed: () {
//                   // Add functionality to log out
//                   // Example: viewModel.logout();
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: AppTheme.iris,
//                 ),
//                 child: Text(
//                   'Log Out',
//                   style: AppTypography.buttonText,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
