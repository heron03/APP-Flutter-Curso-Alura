import 'package:banco/models/contato.dart';
import 'package:flutter/material.dart';
import 'package:banco/database/dao/contato_dao.dart';

class FormularioContato extends StatefulWidget {
  @override
  _FormularioContatoState createState() => _FormularioContatoState();
}

class _FormularioContatoState extends State<FormularioContato> {
  final TextEditingController _nomeCompleto = TextEditingController();
  final TextEditingController _numeroDaConta = TextEditingController();
  final ContatoDao _dao = ContatoDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Novo Contato'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nomeCompleto,
                decoration: InputDecoration(
                  labelText: 'Nome Completo',
                ),
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextField(
                  controller: _numeroDaConta,
                  decoration: InputDecoration(
                    labelText: 'Número da Conta',
                  ),
                  style: TextStyle(
                    fontSize: 24.0,
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text("Novo"),
                    onPressed: () {
                      final String nome = _nomeCompleto.text;
                      final int numeroConta = int.tryParse(_numeroDaConta.text);
                      final Contato novoContato = Contato(0, nome, numeroConta);
                      if (numeroConta != null && nome != null) {
                        _dao.save(novoContato).then((id) => Navigator.pop(context));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
