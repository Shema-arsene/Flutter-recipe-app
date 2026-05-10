import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:recipes_app/main.dart';

void main() {
  testWidgets('App starts with LoginPage', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verifying that the LoginPage is shown
    expect(find.text('Recipe Book'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
  });

  testWidgets('Login form validation shows errors when empty', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp());

    // Clear the text fields
    final usernameField = find.byType(TextFormField).first;
    final passwordField = find.byType(TextFormField).last;

    await tester.enterText(usernameField, '');
    await tester.enterText(passwordField, '');
    await tester.pump();

    // Tap the login button
    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    await tester.tap(loginButton);
    await tester.pump();

    // Now validation messages should appear
    expect(find.text('Please enter your username'), findsOneWidget);
    expect(find.text('Please enter your password'), findsOneWidget);
  });

  testWidgets('Can enter text in username field', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Find username field (first TextFormField)
    final usernameField = find.byType(TextFormField).first;

    // Enter text
    await tester.enterText(usernameField, 'testuser');
    await tester.pump();

    // Verify the text was entered
    expect(find.text('testuser'), findsOneWidget);
  });

  testWidgets('Can enter text in password field', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    // Find password field (last TextFormField)
    final passwordField = find.byType(TextFormField).last;

    // Enter text
    await tester.enterText(passwordField, 'testpassword');
    await tester.pump();

    // Verify the text was entered
    expect(find.text('testpassword'), findsOneWidget);
  });

  testWidgets('Login button exists and is enabled', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(MyApp());

    final loginButton = find.widgetWithText(ElevatedButton, 'Login');
    expect(loginButton, findsOneWidget);

    // Check if button is enabled
    final button = tester.widget<ElevatedButton>(loginButton);
    expect(button.onPressed, isNotNull);
  });
}
