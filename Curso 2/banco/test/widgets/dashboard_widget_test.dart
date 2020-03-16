import 'package:banco/screens/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';


void main() {
  testWidgets('Imagem ser mostrada Dashboard for aberto',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final mainImage = find.byType(Image);
    expect(mainImage, findsOneWidget);
  });
  testWidgets(
      'Mostrar o a funcionalidade de transferencia e feed quando abrir o DashBoard',
      (tester) async {
    await tester.pumpWidget(MaterialApp(home: Dashboard()));
    final transferenciaFeatureItem = find.byWidgetPredicate((widget) =>
        fetureItemMatcher(widget, 'Transferencia', Icons.monetization_on));
    expect(transferenciaFeatureItem, findsOneWidget);
    final feedFeatureItem = find.byWidgetPredicate((widget) =>
        fetureItemMatcher(widget, 'Feed', Icons.description));
    expect(feedFeatureItem, findsOneWidget);
  });
}

