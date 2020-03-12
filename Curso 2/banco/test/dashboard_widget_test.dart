import 'package:flutter_test/flutter_test.dart';
import 'package:banco/screens/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  testWidgets('Imagem ser mostrada Dashboard for aberto', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets('Mostrar o FeatureItem quando abrir o DashBoard',
    (tester) async {
  await tester.pumpWidget(MaterialApp(home: Dashboard()));
  final firstFeature = find.byType(FeatureItem);
  expect(firstFeature, findsWidgets);
});
}

