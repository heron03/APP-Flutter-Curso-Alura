import 'package:banco/models/transacao.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Retorna o valor quando criar uma transação', () {
    final transacao = Transacao(null, 200, null);
    expect(transacao.value, 200);
  });
  test('Deve falhar quando a transferencia for menor que 0', () {
    expect(() => Transacao(null, 0, null), throwsAssertionError);
    expect(() => Transacao(null, -1, null), throwsAssertionError);
  });
}