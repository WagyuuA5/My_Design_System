import 'package:flutter_test/flutter_test.dart';
import 'package:example/main.dart';

void main() {
  testWidgets('CatalogApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const CatalogApp());
    expect(find.byType(CatalogApp), findsOneWidget);
  });
}
