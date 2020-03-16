import 'package:banco/database/dao/contato_dao.dart';
import 'package:flutter/material.dart';
import 'package:banco/screens/dashboard.dart';

void main() {
  runApp(Banco(
    contatoDao: ContatoDao(),
  ));
}

class Banco extends StatelessWidget {
  final ContatoDao contatoDao;
  Banco({@required this.contatoDao});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green[900],
          accentColor: Colors.blueAccent[700],
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: Dashboard(
        contatoDao: contatoDao,
      ),
    );
  }
}
