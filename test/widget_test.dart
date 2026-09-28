import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_application_1/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const StackLabApp());
    expect(find.text('Flutter Stack Lab Manual'), findsOneWidget);
  });
}
