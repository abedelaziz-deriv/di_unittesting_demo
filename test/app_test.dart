import 'package:di_unittesting_demo/app.dart';
import 'package:di_unittesting_demo/keys/landing/landing_screen_keys.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('verify the first page to launch is landing page',
      (tester) async {
    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();

    expect(find.byKey(landingScreenKey), findsOneWidget);
  });
}
