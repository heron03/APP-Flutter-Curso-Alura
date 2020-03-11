import 'package:banco/models/contato.dart';

class Transacao {
  final double value;
  final Contato contato;

  Transacao(
    this.value,
    this.contato,
  );

  Transacao.fromJson(Map<String, dynamic> json)
      : value = json['value'],
        contato = Contato.fromJson(json['contact']);
  
  Map<String, dynamic> toJson() => {
        'value': value,
        'contact': contato.toJson(),
      };

  @override
  String toString() {
    return 'Transacao{value: $value, contato: $contato}';
  }
}
