import 'package:banco/main.dart';
import 'package:banco/screens/dashboard.dart';
import 'package:banco/screens/formulario_contato.dart';
import 'package:banco/screens/lista_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'matchers.dart';
import 'mocks.dart';

void main() {
  testWidgets('Salvar Contato', (tester) async {
    final mockContatoDao = MockContatoDao();
    await tester.pumpWidget(Banco(
      contatoDao: mockContatoDao,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final transferenciaFeatureItem = find.byWidgetPredicate((widget) =>
        fetureItemMatcher(widget, 'Transferencia', Icons.monetization_on));
    expect(transferenciaFeatureItem, findsOneWidget);
    await tester.tap(transferenciaFeatureItem);
    await tester.pumpAndSettle();

    final contactsList = find.byType(ListaContato);
    expect(contactsList, findsOneWidget);

    final fabNovoContato = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNovoContato, findsOneWidget);
    await tester.tap(fabNovoContato);
    await tester.pumpAndSettle();

    final contatoFormulario = find.byType(FormularioContato);
    expect(contatoFormulario, findsOneWidget);
  });
}
