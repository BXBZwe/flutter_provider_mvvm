import 'package:demo_provider_mvvm/src/common/theme/app_theme.dart';
import 'package:demo_provider_mvvm/src/common/theme/app_typography.dart';
import 'package:demo_provider_mvvm/src/common/widgets/card_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  final List<String> cardTitles = [
    'Card 1',
    'Card 2',
    'Card 3',
    'Card 4',
    'Card 5',
  ];

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'List of Cards',
          style: AppTypography.bold.copyWith(color: AppTheme.cloud),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              // Use Navigator.push with MaterialPageRoute to navigate to ProfileView
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => ProfileView()),
              // );
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
        backgroundColor: AppTheme.fuschia,
      ),
      body: ListView.builder(
        itemCount: cardTitles.length,
        itemBuilder: (context, index) {
          return CardWidget(
            title: cardTitles[index],
            subtitle: 'Subtitle for Card $index',
            onTap: () {
              // Add any action you want to perform when a card is tapped
              print('Card $index tapped');
            },
          );
        },
      ),
    );
  }
}
