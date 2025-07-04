// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:weather/main.dart';

void main() {
  testWidgets('Weather app loads correctly', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const WeatherApp());

    // Verify that the app title is displayed.
    expect(find.text('Flutter Weather'), findsOneWidget);

    // Verify that the search button is displayed.
    expect(find.byIcon(Icons.search), findsOneWidget);

    // Verify initial state message is displayed.
    expect(find.text('Please search for a city!'), findsOneWidget);
  });
}
