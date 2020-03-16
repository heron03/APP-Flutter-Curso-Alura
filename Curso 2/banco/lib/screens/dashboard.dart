import 'package:banco/database/dao/contato_dao.dart';
import 'package:banco/screens/lista_transacao.dart';
import 'package:flutter/material.dart';
import 'package:banco/screens/lista_contato.dart';
import 'package:flutter/rendering.dart';

class Dashboard extends StatelessWidget {
  final ContatoDao contatoDao;
  Dashboard({@required this.contatoDao});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
      ),
      body: LayoutBuilder(
        builder: (context, constaints) => SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constaints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('images/banco_logo.png'),
                ),
                Container(
                  height: 90,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FeatureItem(
                        'Transferencia',
                        Icons.monetization_on,
                        onClick: () => _showListaContato(context),
                      ),
                      FeatureItem(
                        'Feed',
                        Icons.description,
                        onClick: () => _showListaTransacao(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showListaContato(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListaContato(
          contatoDao: contatoDao,
        ),
      ),
    );
  }

  void _showListaTransacao(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ListaTransacao(),
      ),
    );
  }
}

class FeatureItem extends StatelessWidget {
  final String nome;
  final IconData icon;
  final Function onClick;

  FeatureItem(this.nome, this.icon, {@required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: Container(
            padding: EdgeInsets.all(8.0),
            width: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  icon,
                  color: Colors.white,
                  size: 24.0,
                ),
                Text(
                  nome,
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
