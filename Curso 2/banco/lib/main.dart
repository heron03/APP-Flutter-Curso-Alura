import 'package:banco/http/webclient.dart';
import 'package:banco/screens/lista_transacao.dart';
import 'package:flutter/material.dart';
import 'package:banco/screens/dashboard.dart';

import 'models/contato.dart';

void main() {
  runApp(Banco());
  save(Transacao(200.0, Contato(0, 'Gui', 2000))).then((transacao) => print(transacao));
}

class Banco extends StatelessWidget {
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
      home: Dashboard(),
    );
  }
}
