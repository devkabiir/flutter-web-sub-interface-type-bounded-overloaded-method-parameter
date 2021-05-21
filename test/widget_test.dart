import 'package:flutter_test/flutter_test.dart';

import 'package:example/main.dart' as App;

void main() {
  testWidgets('compiles for vm without error', (WidgetTester tester) async {
    await tester.pumpWidget(App.app);
    expect(find.text('it compiles'), findsOneWidget);
  });
}
