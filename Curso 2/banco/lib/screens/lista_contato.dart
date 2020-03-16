import 'package:banco/components/Progress.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/screens/formulario_contato.dart';
import 'package:banco/screens/formulario_transacao.dart';
import 'package:banco/widgets/main.dart';
import 'package:flutter/material.dart';

class ListaContato extends StatefulWidget {
  @override
  _ListaContatoState createState() => _ListaContatoState();
}

class _ListaContatoState extends State<ListaContato> {
  @override
  Widget build(BuildContext context) {
    final dependencies = AppDependecies.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Transferencia'),
      ),
      body: FutureBuilder<List<Contato>>(
        initialData: List(),
        future: dependencies.contatoDao.findAll(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Progress();
              break;
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Contato> contatos = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Contato contato = contatos[index];
                  return ContatoItem(
                    contato,
                    onClick: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FormularioTransacao(contato),
                        ),
                      );
                    },
                  );
                },
                itemCount: contatos.length,
              );
              break;
          }
          return Text('Ocoreu um error');
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioContato(),
            ),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}

class ContatoItem extends StatelessWidget {
  final Contato contato;
  final Function onClick;

  ContatoItem(
    this.contato, {
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => onClick(),
        title: Text(
          contato.nome,
          style: TextStyle(
            fontSize: 24.0,
          ),
        ),
        subtitle: Text(
          contato.numeroConta.toString(),
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
