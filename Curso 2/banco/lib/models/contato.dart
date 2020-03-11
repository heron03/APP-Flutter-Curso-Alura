class Contato {
  final int id;
  final String nome;
  final int numeroConta;

  Contato(this.id, this.nome, this.numeroConta);

  Contato.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        nome = json['name'],
        numeroConta = json['accountNumber'];
        
  Map<String, dynamic> toJson() => {
        'name': nome,
        'accountNumber': numeroConta,
      };
  @override
  String toString() {
    return 'Contato{id: $id, nome: $nome, numeroConta: $numeroConta}';
  }
}
