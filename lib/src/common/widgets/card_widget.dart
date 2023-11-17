import 'package:demo_provider_mvvm/src/common/theme/app_typography.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function()? onTap;

  CardWidget({
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ListTile(
        title: Text(
          title,
          style: AppTypography.body,
        ),
        subtitle: Text(
          subtitle,
          style: AppTypography.small,
        ),
        onTap: onTap,
      ),
    );
  }
}
