import 'package:banco/models/contato.dart';
import 'package:flutter/material.dart';

class ListaTransacao extends StatelessWidget {
  final List<Transacao> transacaos = List();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transacaos'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final Transacao transacao = transacaos[index];
          return Card(
            child: ListTile(
              leading: Icon(Icons.monetization_on),
              title: Text(
                transacao.value.toString(),
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(
                transacao.contato.numeroConta.toString(),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),
          );
        },
        itemCount: transacaos.length,
      ),
    );
  }
}

class Transacao {
  final double value;
  final Contato contato;

  Transacao(
    this.value,
    this.contato,
  );

  @override
  String toString() {
    return 'Transacao{value: $value, contato: $contato}';
  }

}
