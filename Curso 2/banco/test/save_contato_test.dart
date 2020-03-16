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

    final listaContato = find.byType(ListaContato);
    expect(listaContato, findsOneWidget);

    final fabNovoContato = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNovoContato, findsOneWidget);
    await tester.tap(fabNovoContato);
    await tester.pumpAndSettle();

    final contatoFormulario = find.byType(FormularioContato);
    expect(contatoFormulario, findsOneWidget);

    final nomeTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Nome Completo';
      }
      return false;
    });
    expect(nomeTextField, findsOneWidget);
    await tester.enterText(nomeTextField, 'Heron');

    final numeroContaTextField = find.byWidgetPredicate((widget) {
      if (widget is TextField) {
        return widget.decoration.labelText == 'Número da Conta';
      }
      return false;
    });
    expect(numeroContaTextField, findsOneWidget);
    await tester.enterText(nomeTextField, '1000');

    final createButton = find.widgetWithText(RaisedButton, 'Novo');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();

    final listaContatoBack = find.byType(ListaContato);
    expect(listaContatoBack, findsOneWidget);
  });
}
