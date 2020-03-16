import 'package:banco/components/response_dialog.dart';
import 'package:banco/components/transacao_auth_dialog.dart';
import 'package:banco/main.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/models/transacao.dart';
import 'package:banco/screens/dashboard.dart';
import 'package:banco/screens/formulario_transacao.dart';
import 'package:banco/screens/lista_contato.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../matchers/matchers.dart';
import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('Transferir para o Contato', (tester) async {
    final mockContatoDao = MockContatoDao();
    final mockTransactionWebClient = MockTransactionWebClient();
    await tester.pumpWidget(Banco(
      contatoDao: mockContatoDao,
      transactionWebClient: mockTransactionWebClient,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    final heron = Contato(0, 'Heron', 1000);
    when(mockContatoDao.findAll()).thenAnswer((invocation) async => [heron]);

    await clickOnTheTransfertenciaFetureItem(tester);
    await tester.pumpAndSettle();

    final listaContato = find.byType(ListaContato);
    expect(listaContato, findsOneWidget);

    verify(mockContatoDao.findAll()).called(1);

    final contatoItem = find.byWidgetPredicate((widget) {
      if (widget is ContatoItem) {
        return widget.contato.nome == 'Heron' &&
            widget.contato.numeroConta == 1000;
      }
      return false;
    });
    expect(contatoItem, findsOneWidget);
    await tester.tap(contatoItem);
    await tester.pumpAndSettle();

    final transacaoForm = find.byType(FormularioTransacao);
    expect(transacaoForm, findsOneWidget);

    final contatoNome = find.text('Heron');
    expect(contatoNome, findsOneWidget);
    final contatoNumeroConta = find.text('1000');
    expect(contatoNumeroConta, findsOneWidget);

    final textFieldValue = find.byWidgetPredicate((widget) {
      return textFieldMatcher(widget, 'Valor');
    });
    expect(textFieldValue, findsOneWidget);
    await tester.enterText(textFieldValue, '200');

    final transferenciaButton =
        find.widgetWithText(RaisedButton, 'Transferencia');
    expect(transferenciaButton, findsOneWidget);

    await tester.tap(transferenciaButton);
    await tester.pumpAndSettle();

    final transacaoAuthDialog = find.byType(TransacaoAuthDialog);
    expect(transacaoAuthDialog, findsOneWidget);

    final textFiedlSenha = find.byKey(transacaoAuthDialogKeyTextFieldSenha);
    expect(textFiedlSenha, findsOneWidget);
    await tester.enterText(textFiedlSenha, '1000');

    final cancelButton = find.widgetWithText(FlatButton, 'Cancelar');
    expect(cancelButton, findsOneWidget);

    final confirmButton = find.widgetWithText(FlatButton, 'Confirmar');
    expect(confirmButton, findsOneWidget);

    when(mockTransactionWebClient.save(Transacao(null, 200, heron), '1000'))
        .thenAnswer((_) async => Transacao(null, 200, heron));
    await tester.tap(confirmButton);
    await tester.pumpAndSettle();

    final successDialog = find.byType(SuccessDialog);
    expect(successDialog, findsOneWidget);

    final okButton = find.widgetWithText(FlatButton, 'Ok');
    expect(okButton, findsOneWidget);

    await tester.tap(okButton);
    await tester.pumpAndSettle();

    final contactsListBack = find.byType(ListaContato);
    expect(contactsListBack, findsOneWidget);
  });
}
