import 'dart:convert';

import 'package:banco/models/contato.dart';
import 'package:banco/screens/lista_transacao.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

class LoginInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData data}) async {
    return data;
  }
}

final Client client = HttpClientWithInterceptor.build(
  interceptors: [LoginInterceptor()],
);
const String baseUrl = 'http://10.0.0.103:8080/transactions';
Future<List<Transacao>> findAll() async {
  final Response response =
      await client.get(baseUrl).timeout(Duration(seconds: 5));
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

Future<Transacao> save(Transacao transacao) async {
  final Map<String, dynamic> trasacaoMap = {
    'value': transacao.value,
    'contact': {
      'name': transacao.contato.nome,
      'accontNumber': transacao.contato.numeroConta,
    }
  };
  final String transacaoJson = jsonEncode(trasacaoMap);
  final Response response = await client.post(
    baseUrl,
    headers: {
      'Content-type': 'application/json',
      'password': '1000',
    },
    body: transacaoJson,
  );

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
