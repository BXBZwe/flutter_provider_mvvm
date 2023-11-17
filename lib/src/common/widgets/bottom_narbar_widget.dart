import 'package:demo_provider_mvvm/src/common/app_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationIndex>(
      builder: (context, navigationModel, child) {
        return BottomNavigationBar(
          currentIndex: navigationModel.currentIndex,
          onTap: (index) {
            if (index != navigationModel.currentIndex) {
              // Only navigate if the selected index is different from the current index
              navigationModel.setIndex(index);
              switch (index) {
                case 0:
                  Navigator.pushReplacementNamed(context, '/');
                  break;
                case 1:
                  Navigator.pushReplacementNamed(context, '/profile');
                  break;
                // Add more cases for additional tabs

                default:
                  break;
              }
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
            // Add more BottomNavigationBarItems for additional tabs
          ],
        );
      },
    );
  }
}
