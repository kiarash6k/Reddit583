import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:reddit583/app.dart';
import 'package:reddit583/routes.dart';
import 'package:reddit583/screens/home_screen.dart';

Future<void> _pumpApp(WidgetTester tester, String route) async {
  tester.view.physicalSize = const Size(800, 1600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.reset);
  await tester.pumpWidget(Reddit583App(initialRoute: route));
  await tester.pumpAndSettle();
}

void main() {
  testWidgets('splash leads to the welcome screen', (tester) async {
    await _pumpApp(tester, Routes.splash);
    await tester.pump(const Duration(seconds: 2));
    await tester.pumpAndSettle();
    expect(find.text('Get Started'), findsOneWidget);
  });

  testWidgets('login shows errors for empty fields and blocks navigation',
      (tester) async {
    await _pumpApp(tester, Routes.login);
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();
    expect(find.text('Enter your username'), findsOneWidget);
    expect(find.text('Enter your password'), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });

  testWidgets('login with credentials opens the home feed', (tester) async {
    await _pumpApp(tester, Routes.login);
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Username'), 'yoda');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'), 'anything');
    await tester.tap(find.text('Log in'));
    await tester.pumpAndSettle();
    expect(find.byType(HomeScreen), findsOneWidget);
    expect(find.text('Finally, the new agent'), findsOneWidget);
  });

  testWidgets('sign up validates password confirmation', (tester) async {
    await _pumpApp(tester, Routes.signUp);
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Username'), 'yoda');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Email'), 'yoda@example.com');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Password'), 'GoodPass123');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Confirm password'), 'Different1');
    await tester.tap(find.text('Create account'));
    await tester.pumpAndSettle();
    expect(find.text('Passwords do not match'), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
  });

  testWidgets('upvoting a post updates its score', (tester) async {
    await _pumpApp(tester, Routes.home);
    expect(find.text('128'), findsOneWidget);
    await tester.tap(find.byTooltip('Upvote').first);
    await tester.pump();
    expect(find.text('129'), findsOneWidget);
  });

  testWidgets('dark mode switch flips the theme', (tester) async {
    await _pumpApp(tester, Routes.home);
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(HomeScreen))).brightness,
        Brightness.dark);
    await tester.tap(find.byType(Switch));
    await tester.pumpAndSettle();
    expect(Theme.of(tester.element(find.byType(HomeScreen))).brightness,
        Brightness.light);
  });
}
