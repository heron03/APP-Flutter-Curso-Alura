import 'package:flutter/material.dart';

class TransacaoAuthDialog extends StatefulWidget {
  final Function(String senha) onConfirm;

  const TransacaoAuthDialog({
    @required this.onConfirm,
  });

  @override
  _TransacaoAuthDialogState createState() => _TransacaoAuthDialogState();
}

const Key transacaoAuthDialogKeyTextFieldSenha =
    Key('transacaoAuthDialogTextFieldSenha');

class _TransacaoAuthDialogState extends State<TransacaoAuthDialog> {
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Senha 4 digitos"),
      content: TextField(
        key: transacaoAuthDialogKeyTextFieldSenha,
        controller: _senhaController,
        obscureText: true,
        maxLength: 4,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
        ),
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: TextStyle(fontSize: 40, letterSpacing: 16),
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancelar'),
        ),
        FlatButton(
          onPressed: () {
            widget.onConfirm(_senhaController.text);
            Navigator.pop(context);
          },
          child: Text('Confirmar'),
        ),
      ],
    );
  }
}
