import 'package:banco/main.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/screens/dashboard.dart';
import 'package:banco/screens/formulario_contato.dart';
import 'package:banco/screens/lista_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('Salvar Contato', (tester) async {
    final mockContatoDao = MockContatoDao();
    await tester.pumpWidget(Banco(
      contatoDao: mockContatoDao, transactionWebClient: null,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);


    await clickOnTheTransfertenciaFetureItem(tester);
    await tester.pumpAndSettle();

    final listaContato = find.byType(ListaContato);
    expect(listaContato, findsOneWidget);

    verify(mockContatoDao.findAll()).called(1);

    final fabNovoContato = find.widgetWithIcon(FloatingActionButton, Icons.add);
    expect(fabNovoContato, findsOneWidget);
    await tester.tap(fabNovoContato);
    await tester.pumpAndSettle();

    final contatoFormulario = find.byType(FormularioContato);
    expect(contatoFormulario, findsOneWidget);

    final nomeTextField = find.byWidgetPredicate(
        (widget) => textFieldMatcher(widget, 'Nome Completo'));
    expect(nomeTextField, findsOneWidget);
    await tester.enterText(nomeTextField, 'Heron');

    final numeroContaTextField = find.byWidgetPredicate(
        (widget) => textFieldMatcher(widget, 'Número da Conta'));
    expect(numeroContaTextField, findsOneWidget);
    await tester.enterText(nomeTextField, '1000');

    final createButton =  find.widgetWithText(RaisedButton, 'Novo');
    expect(createButton, findsOneWidget);
    await tester.tap(createButton);
    await tester.pumpAndSettle();
    await tester.pump();

    verifyNever(mockContatoDao.save(Contato(0, 'Heron', 1000)));

    final listaContatoBack = find.byType(ListaContato);
    expect(listaContatoBack, findsNothing);

    verifyNever(mockContatoDao.findAll());
  });
}

