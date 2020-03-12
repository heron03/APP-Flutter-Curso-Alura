import 'package:banco/models/contato.dart';

class Transacao {
  final double value;
  final Contato contato;
  final String id;

  Transacao(
    this.id,
    this.value,
    this.contato,
  );

  Transacao.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        value = json['value'],
        contato = Contato.fromJson(json['contact']);

  Map<String, dynamic> toJson() => {
        'id': id,
        'value': value,
        'contact': contato.toJson(),
      };
}
