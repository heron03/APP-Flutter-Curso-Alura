import 'package:flutter/material.dart';

class TransacaoAuthDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Senha 4 digitos"),
      content: TextField(
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 64, letterSpacing: 32),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: null,
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: null,
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
