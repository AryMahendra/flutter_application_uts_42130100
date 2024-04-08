import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_application_uts_42130100/main.dart';

void main() {
  testWidgets('Test wallet balance', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that wallet balance starts at $100.
    expect(find.text('\$100.00'), findsOneWidget);

    // Tap the 'Add $10' button and trigger a frame.
    await tester.tap(find.text('Add \$10'));
    await tester.pump();

    // Verify that wallet balance has increased by $10.
    expect(find.text('\$110.00'), findsOneWidget);

    // Tap the 'Spend $20' button and trigger a frame.
    await tester.tap(find.text('Spend \$20'));
    await tester.pump();

    // Verify that wallet balance has decreased by $20.
    expect(find.text('\$90.00'), findsOneWidget);
  });
}