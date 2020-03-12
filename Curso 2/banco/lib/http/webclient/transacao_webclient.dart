import 'dart:convert';

import 'package:banco/http/webclient.dart';
import 'package:banco/models/transacao.dart';
import 'package:http/http.dart';

class TransactionWebClient {
  Future<List<Transacao>> findAll() async {
    final Response response =
        await client.get(baseUrl).timeout(Duration(seconds: 5));
    final List<dynamic> decodedJson = jsonDecode(response.body);
    return decodedJson.map((dynamic json) => Transacao.fromJson(json)).toList();
  }

  Future<Transacao> save(Transacao transacao, String senha) async {
    final String transacaoJson = jsonEncode(transacao.toJson());

    final Response response = await client.post(baseUrl,
        headers: {
          'Content-type': 'application/json',
          'password': senha,
        },
        body: transacaoJson);

    if (response.statusCode == 200) {
      return Transacao.fromJson(jsonDecode(response.body));
    }

    _throwHttpError(response.statusCode);
  }

  void _throwHttpError(int statusCode) =>
      throw Exception(_statusCodeResponses[statusCode]);

  static final Map<int, String> _statusCodeResponses = {
    400: 'Não informado o valor da transação',
    401: 'Senha Invalida',
  };
}
