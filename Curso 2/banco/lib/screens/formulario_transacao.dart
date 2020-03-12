import 'package:banco/components/response_dialog.dart';
import 'package:banco/components/transacao_auth_dialog.dart';
import 'package:banco/http/webclient/transacao_webclient.dart';
import 'package:flutter/material.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/models/transacao.dart';
import 'package:path/path.dart';

class FormularioTransacao extends StatefulWidget {
  final Contato contato;

  FormularioTransacao(this.contato);

  @override
  _FormularioTransacaoState createState() => _FormularioTransacaoState();
}

class _FormularioTransacaoState extends State<FormularioTransacao> {
  final TextEditingController _valueController = TextEditingController();
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova transação'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.contato.nome,
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  widget.contato.numeroConta.toString(),
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: TextField(
                  controller: _valueController,
                  style: TextStyle(fontSize: 24.0),
                  decoration: InputDecoration(labelText: 'Valor'),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: SizedBox(
                  width: double.maxFinite,
                  child: RaisedButton(
                    child: Text('Transferencia'),
                    onPressed: () {
                      final double value =
                          double.tryParse(_valueController.text);
                      final transacaoCreated = Transacao(value, widget.contato);
                      showDialog(
                        context: context,
                        builder: (contextDialog) {
                          return TransacaoAuthDialog(
                            onConfirm: (String senha) {
                              _save(transacaoCreated, senha, context);
                            },
                          );
                        },
                      );
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _save(
      Transacao transacaoCreated, String senha, BuildContext context) async {
    _webClient.save(transacaoCreated, senha).then((transacao) {
      if (transacao != null) {
        showDialog(
            context: context,
            builder: (contextDialog) {
              return SuccessDialog('Sucesso na Transação');
            }).then((value) => Navigator.pop(context));
      }
    }).catchError((e) {
      showDialog(
          context: context,
          builder: (contextDialog) {
            return FailureDialog(e.message);
          });
    }, test: (e) => e is Exception);
  }
}
