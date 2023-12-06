import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:demo_provider_mvvm/src/modules/home/home_view.dart';
import 'package:demo_provider_mvvm/src/common/widgets/card_widget.dart';

void main() {
  testWidgets('HomeView should display a list of cards',
      (WidgetTester tester) async {
    // Pump the HomeView widget onto the screen
    await tester.pumpWidget(
      MaterialApp(home: HomeView()),
    );

    // Verify that the title 'List of Cards' is displayed
    expect(find.text('List of Cards'), findsOneWidget);

    // Verify that five CardWidgets are displayed
    expect(find.byType(CardWidget), findsNWidgets(5));

    // Optionally: Check for the presence of specific card titles
    for (int i = 1; i <= 5; i++) {
      expect(find.text('Card $i'), findsOneWidget);
    }

    // Optionally: Simulate interactions and verify outcomes
    // Example: Tapping a card
    await tester.tap(find.byType(CardWidget).at(0));
    await tester.pumpAndSettle();
    // Add assertions to verify the outcome of the card tap if necessary
  });

  // Add any tearDown code if necessary
}
