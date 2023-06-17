import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:integration_testing/home_screen.dart';
import 'package:integration_testing/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end to end test", () {
    testWidgets("Verify login screen with correct username and password",
        (tester) async {
      app.main();
      //* this method is called to rebuild the widget till all the frames are built
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'username');
      await tester.enterText(find.byType(TextFormField).at(1), 'password');

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });

    testWidgets(
        "Verify alertdialog box is opened with wrong username and password",
        (tester) async {
      app.main();
      //* this method is called to rebuild the widget till all the frames are built
      await tester.pumpAndSettle();

      await tester.enterText(find.byType(TextFormField).at(0), 'userame');
      await tester.enterText(find.byType(TextFormField).at(1), 'passord');

      await tester.tap(find.byType(ElevatedButton));

      await tester.pumpAndSettle();

      expect(find.byType(AlertDialog), findsOneWidget);
    });
  });
}
