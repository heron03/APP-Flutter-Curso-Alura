import 'package:flutter/material.dart';
import 'package:banco/screens/dashboard.dart';

import 'package:banco/database/app_database.dart';
import 'models/contato.dart';

void main() {
  runApp(Banco());
  findAll().then((contatos) => debugPrint(contatos.toString())); 
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
