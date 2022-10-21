import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_testings/main.dart';
import 'package:ui_testings/screens/aboutus.dart';
import 'package:ui_testings/screens/home.dart';

void main() {
  group('Home Screen Test', () {
    testWidgets('Judul halaman Home Screen', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );
      expect(find.text('Flutter Home'), findsOneWidget);
    });
    
    testWidgets('Test Body MyhomePage', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MyApp()
      );
      expect(find.byType(MyHomePage), findsOneWidget);
    });
    
    testWidgets('Tombol increment', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: MyHomePage(),
        ),
      );
      await tester.tap(
        find.byIcon(Icons.add)
      );
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });    
  });

  group('About Screen Test', () {
    testWidgets('Test About Screen', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
      expect(find.byType(AboutUsScreen), findsNothing);
    });
  });
}