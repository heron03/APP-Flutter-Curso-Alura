import 'package:banco/components/Progress.dart';
import 'package:banco/components/centered_message.dart';
import 'package:banco/http/webclient.dart';
import 'package:banco/models/transacao.dart';
import 'package:flutter/material.dart';

class ListaTransacao extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transacaos'),
      ),
      body: FutureBuilder<List<Transacao>>(
        future: findAll(),
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
              if (snapshot.hasData) {
                final List<Transacao> transacaos = snapshot.data;
                if (transacaos.isNotEmpty) {
                  return ListView.builder(
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
                  );
                }
                return CenteredMessage(
                  'Nenhuma transação Feita',
                  icon: Icons.warning,
                );
              }

              return CenteredMessage(
                'Serviço indisponivel',
                icon: Icons.warning,
              );
              break;
          }
          return Text('Ocorreu um Erro desconhecido no APP');
        },
      ),
    );
  }
}
