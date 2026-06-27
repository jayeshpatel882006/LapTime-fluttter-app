import 'package:flutter_test/flutter_test.dart';

import 'package:hello_flutter/app.dart';

void main() {
  testWidgets('App should render', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('LapTime'), findsOneWidget);
  });
}
