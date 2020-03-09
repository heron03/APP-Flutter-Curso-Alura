import 'package:banco/screens/transferencia/lista.dart';
import 'package:flutter/material.dart';

void main() => runApp(Banco());

class Banco extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
		theme: ThemeData(
			primaryColor: Colors.green[900],
			accentColor: Colors.blueAccent[700],
			buttonTheme: ButtonThemeData(
			buttonColor: Colors.blueAccent[700],
			textTheme: ButtonTextTheme.primary
			)
		),
		home: ListaTrasnferencias(),
	);
  }
}