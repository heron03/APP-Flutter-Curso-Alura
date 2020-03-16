import 'package:banco/database/dao/contato_dao.dart';
import 'package:banco/widgets/main.dart';
import 'package:flutter/material.dart';
import 'package:banco/screens/dashboard.dart';

import 'http/webclient/transacao_webclient.dart';

void main() {
  runApp(Banco(
    contatoDao: ContatoDao(),
    transactionWebClient: TransactionWebClient(),
  ));
}

class Banco extends StatelessWidget {
  final ContatoDao contatoDao;
  final TransactionWebClient transactionWebClient;
  Banco({
    @required this.contatoDao,
    @required this.transactionWebClient,
  });
  @override
  Widget build(BuildContext context) {
    return AppDependecies(
      contatoDao: contatoDao,
      transactionWebClient: transactionWebClient,
      child: MaterialApp(
        theme: ThemeData(
            primaryColor: Colors.green[900],
            accentColor: Colors.blueAccent[700],
            buttonTheme: ButtonThemeData(
              buttonColor: Colors.blueAccent[700],
              textTheme: ButtonTextTheme.primary,
            )),
        home: Dashboard(),
      ),
    );
  }
}
