import 'package:banco/database/app_database.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/screens/formulario_contato.dart';
import 'package:flutter/material.dart';

class ListaContatato extends StatefulWidget {
  @override
  _ListaContatatoState createState() => _ListaContatatoState();
}

class _ListaContatatoState extends State<ListaContatato> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
      ),
      body: FutureBuilder<List<Contato>>(
          initialData: List(),
          future: findAll(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CircularProgressIndicator(),
                      Text('Aguarde'),
                    ],
                  ),
                );
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contato> contatos = snapshot.data;

                return ListView.builder(
                  itemBuilder: (context, index) {
                    final Contato contato = contatos[index];

                    return _ContatoItem(contato);
                  },
                  itemCount: contatos.length,
                );
                break;
            }

            return Text('Ocorreu um Erro');
          }),
        floatingActionButton: FloatingActionButton(
        onPressed: () async{
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => FormularioContato(),
            ),
          );
          setState(() {

          }); 
        },
        child: Icon(
          Icons.add,
        ),
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
