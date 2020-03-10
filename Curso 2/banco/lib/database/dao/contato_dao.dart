import 'package:banco/models/contato.dart';
import 'package:sqflite/sqlite_api.dart';

import '../app_database.dart';

class ContatoDao {

  
  static final String tableSql ='CREATE TABLE contatos('
      'id INTEGER PRIMARY KEY, '
      'nome TEXT, '
      'numeroConta INTEGER)';

  static const String _tableName = 'contatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numeroConta';

  Future<int> save(Contato contato) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contatoMap = _toMap(contato);
    return db.insert(_tableName, contatoMap);
  }

  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contatoMap = Map();
    contatoMap[_nome] = contato.nome;
    contatoMap[_numeroConta] = contato.numeroConta;
    return contatoMap;
  }

  Future<List<Contato>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> contatoDBs = await db.query(_tableName);
    List<Contato> contatos = _toList(contatoDBs);

    return contatos;
  }

  List<Contato> _toList(List<Map<String, dynamic>> contatoDBs) {
     final List<Contato> contatos = List();
    for (Map<String, dynamic> contatoDB in contatoDBs) {
      final Contato contato = Contato(
        contatoDB[_id],
        contatoDB[_nome],
        contatoDB[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
