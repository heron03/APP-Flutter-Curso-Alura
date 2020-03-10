import 'package:flutter/material.dart';
import 'package:banco/database/app_database.dart';
import 'package:banco/screens/formulario_contato.dart';
import 'package:banco/models/contato.dart';

class ListaContatatos extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          final List<Contato> contatos = snapshot.data;
          return ListView.builder(
            itemBuilder: (context, index) {
            final Contato contato = contatos[index];

            return _ContatoItem(contato);
          },
        itemCount: contatos.length,
      );
      }),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(
                MaterialPageRoute(
                  builder: (context) => FormularioContato(),
                ),
              )
              .then(
                (novoContato) => debugPrint(novoContato.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contato contato;

  _ContatoItem(this.contato);
  
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contato.nome,
          style: TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}