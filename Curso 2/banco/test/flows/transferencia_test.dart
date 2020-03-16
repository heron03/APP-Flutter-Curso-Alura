import 'package:banco/main.dart';
import 'package:banco/screens/dashboard.dart';
import 'package:banco/screens/lista_contato.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../mocks/mocks.dart';
import 'actions.dart';

void main() {
  testWidgets('Transferir para o Contato', (tester) async {

    final mockContatoDao = MockContatoDao();
    await tester.pumpWidget(Banco(
      contatoDao: mockContatoDao,
    ));

    final dashboard = find.byType(Dashboard);
    expect(dashboard, findsOneWidget);

    await clickOnTheTransfertenciaFetureItem(tester);
    await tester.pumpAndSettle();

    final listaContato = find.byType(ListaContato);
    expect(listaContato, findsOneWidget);

    verify(mockContatoDao.findAll()).called(1);

  });
}

