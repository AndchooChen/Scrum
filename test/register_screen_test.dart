import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrum/screens/game-pin-screen.dart';
import 'package:scrum/screens/login-screen.dart';
import 'package:scrum/screens/register-screen.dart';

void main() {
  testWidgets('Check Layout for RegisterScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: RegisterScreen(),
      ),
    );

    expect(find.byKey(Key('backButton')), findsOneWidget);
    expect(find.byKey(Key('nameFormField')), findsOneWidget);
    expect(find.byKey(Key('emailFormField')), findsOneWidget);
    expect(find.byKey(Key('passwordFormField')), findsOneWidget);
    expect(find.byKey(Key('signUpButton')), findsOneWidget);
    expect(find.text("Register here!"), findsOneWidget);
    expect(find.text("Already have an account? "), findsOneWidget);
    expect(find.text('Log in'), findsOneWidget);
  });

  testWidgets('Check if Sign Up Button Works when all Text Fields are Empty',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    // Find the sign up button using its key
    final Finder signUpButton = find.byKey(Key('signUpButton'));

    // Tap the sign up button
    await tester.tap(signUpButton);
    await tester.pump();

    // Expect that the validation message is displayed
    expect(find.text('Name can\'t be empty'), findsOneWidget);
    expect(find.text('Email can\'t be empty'), findsOneWidget);
    expect(find.text('Password can\'t be empty'), findsOneWidget);
  });

  testWidgets(
      'Check if Sign Up Button Works when password field is empty but name field is filled',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    final nameTextField = find.byKey(Key('nameFormField'));
    expect(nameTextField, findsOneWidget);
    await tester.enterText(nameTextField, 'John');

    // Navigate to the register screen
    await tester.tap(find.byKey(Key('signUpButton')));
    await tester.pump();

    expect(find.text('Name can\'t be empty'), findsNothing);
    expect(find.text('Email can\'t be empty'), findsOneWidget);
    expect(find.text('Password can\'t be empty'), findsOneWidget);
  });

  testWidgets('Check if Back Button Works', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    final backButtonFinder = find.byKey(Key('backButton'));

    await tester.tap(backButtonFinder);
    await tester.pump();

    expect(find.byType(GamePinScreen), findsOneWidget);
  });

  testWidgets('Test Login Gesture to Login Screen',
      (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(MaterialApp(home: RegisterScreen()));

    await tester.tap(find.byKey(Key('loginGesture')));
    await tester.pump();

    // Check if the LoginScreen is displayed
    expect(find.byType(LoginScreen), findsOneWidget);
  });
}
