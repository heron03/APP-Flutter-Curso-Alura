class Contato {
  final String nome;
  final int numeroConta;

  Contato(this.nome, this.numeroConta);

  @override
  String toString() {
    return 'Contato{nome: $nome, numeroConta: $numeroConta}';
  }
}