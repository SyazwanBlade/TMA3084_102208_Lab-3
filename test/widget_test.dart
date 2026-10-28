import 'package:flutter_test/flutter_test.dart';
import 'package:restaurant_menu/main.dart';

void main() {
  testWidgets('shows three food cards and opens detail on tap',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.byType(FoodCard), findsNWidgets(3));

    await tester.tap(find.text('Salmon Sushi'));
    await tester.pumpAndSettle();

    expect(find.byType(DetailPage), findsOneWidget);
  });
}
