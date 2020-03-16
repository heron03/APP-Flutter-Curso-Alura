
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import '../matchers/matchers.dart';

Future<void> clickOnTheTransfertenciaFetureItem(WidgetTester tester) async {
  final transferenciaFeatureItem = find.byWidgetPredicate((widget) =>
      fetureItemMatcher(widget, 'Transferencia', Icons.monetization_on));
  expect(transferenciaFeatureItem, findsOneWidget);
  return tester.tap(transferenciaFeatureItem);
}
