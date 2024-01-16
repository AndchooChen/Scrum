import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:scrum/screens/game-pin-screen.dart';
import 'package:scrum/screens/login-screen.dart';
import 'package:scrum/screens/register-screen.dart';

void main() {
  testWidgets('Checking Layout for GamePinScreen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const GamePinScreen(),
      ),
    );

    // Find the OutlinedButton widget with the text 'Login'
    final loginButtonFinder = find.byKey(Key('loginButton'));
    // Verify that the widget is present in the widget tree
    expect(loginButtonFinder, findsOneWidget);

    final signUpButtonFinder = find.byKey(Key('signUpButton'));
    expect(signUpButtonFinder, findsOneWidget);

    expect(find.text('SCRUM'), findsOneWidget);
  });

  testWidgets('Checking if Textfields Work in GamePinScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GamePinScreen(),
      ),
    );

    // Enter text into the TextField
    final textFieldFinder = find.byKey(Key('nicknameTextField'));
    await tester.enterText(textFieldFinder, 'Andrew');

    // Ensure that the text in the TextField matches the entered text
    expect(
        (textFieldFinder.evaluate().first.widget as TextField).controller!.text,
        'Andrew');
  });

  testWidgets('Checking if Enter Button works when no fields are entered',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GamePinScreen(),
      ),
    );

    // Find the enter button and tap it
    final enterButton = find.byKey(Key('enterButton'));
    expect(enterButton, findsOneWidget);
    await tester.tap(enterButton);
    await tester.pumpAndSettle();

    // Ensure the dialog is displayed
    final dialogTitle = find.text('Please enter a game pin and nickname');
    final dialogOKButton = find.text('OK');
    expect(dialogTitle, findsOneWidget);
    expect(dialogOKButton, findsOneWidget);

    // Dismiss the dialog
    await tester.tap(dialogOKButton);
    await tester.pumpAndSettle();

    // Ensure the dialog is dismissed
    expect(dialogTitle, findsNothing);
    expect(dialogOKButton, findsNothing);
  });

  testWidgets('Check if textfields are on screen', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GamePinScreen(),
      ),
    );

    final pinFieldFinder = find.byKey(Key('pinField'));
    // Verify that the widget is present in the widget tree
    expect(pinFieldFinder, findsOneWidget);

    final nicknameFinder = find.byKey(Key('nicknameTextField'));
    expect(nicknameFinder, findsOneWidget);

    await tester.enterText(pinFieldFinder, '123456');
    expect(
        (pinFieldFinder.evaluate().first.widget as TextField).controller!.text,
        '123456');
  });
}
