// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:hydro_tracker/app/app.dart';

void main() {
  testWidgets('HydroTracker app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const HydroTrackerApp());

    // Verify that our app shows the correct title.
    expect(find.text('HydroTracker'), findsOneWidget);
    expect(find.text('자극물 섭취량 추적 앱'), findsOneWidget);
    expect(find.text('개발 중...'), findsOneWidget);
  });
}
