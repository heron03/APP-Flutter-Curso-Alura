
import 'package:banco/models/contato.dart';

class Transacao {
  final double value;
  final Contato contato;

  Transacao(
    this.value,
    this.contato,
  );

  @override
  String toString() {
    return 'Transacao{value: $value, contato: $contato}';
  }
}
