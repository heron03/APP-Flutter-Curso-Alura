import 'dart:convert';

import 'package:banco/http/webclient.dart';
import 'package:banco/models/contato.dart';
import 'package:banco/models/transacao.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transacao>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    List<Transacao> transacaos = _toTransferencias(response);

    return transacaos;
  }

  Future<Transacao> save(Transacao transacao) async {
    Map<String, dynamic> trasacaoMap = _toMap(transacao);
    final String transacaoJson = jsonEncode(trasacaoMap);
    final Response response = await client.post(
      baseUrl,
      headers: {
        'Content-type': 'application/json',
        'password': '1000',
      },
      body: transacaoJson,
    );

    return _toTransacao(response);
  }

  List<Transacao> _toTransferencias(Response response) {
    final List<dynamic> decodeJson = jsonDecode(response.body);
    final List<Transacao> transacaos = List();
    for (Map<String, dynamic> transacaoJson in decodeJson) {
      final Map<String, dynamic> contatoJson = transacaoJson['contact'];
      contatoJson['nome'] = contatoJson['name'];
      contatoJson['numeroConta'] = contatoJson['accountNumber'];
      final Transacao transacao = Transacao(
        transacaoJson['value'],
        Contato(
          0,
          contatoJson['nome'],
          contatoJson['numeroConta'],
        ),
      );
      transacaos.add(transacao);
    }
    return transacaos;
  }

  Transacao _toTransacao(Response response) {
    Map<String, dynamic> transacaoJsonDecode = jsonDecode(response.body);
    final Map<String, dynamic> contatoJson = transacaoJsonDecode['contact'];
    return Transacao(
      transacaoJsonDecode['value'],
      Contato(
        0,
        contatoJson['name'],
        contatoJson['accontNumber'],
      ),
    );
  }

  Map<String, dynamic> _toMap(Transacao transacao) {
    final Map<String, dynamic> trasacaoMap = {
      'value': transacao.value,
      'contact': {
        'name': transacao.contato.nome,
        'accountNumber': transacao.contato.numeroConta,
      }
    };
    return trasacaoMap;
  }
}
