import 'package:flutter_test/flutter_test.dart';
import 'package:trail_book_flutter_app/app.dart';

void main() {
  testWidgets('shows app shell', (WidgetTester tester) async {
    await tester.pumpWidget(const TrailBookApp());

    expect(find.text('TrailBook'), findsOneWidget);
    expect(find.text('TrailBook app'), findsOneWidget);
  });
}
