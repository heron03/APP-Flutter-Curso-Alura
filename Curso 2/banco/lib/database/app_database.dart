import 'package:banco/models/contato.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'banco.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contatos('
          'id INTEGER PRIMARY KEY, '
          'nome TEXT, '
          'numeroConta INTEGER) ');
    },
    version: 1,
    //  onDowngrade: onDatabaseDowngradeDelete,
  );
}

Future<int> save(Contato contato) async {
  final Database db = await getDatabase();
  final Map<String, dynamic> contatoMap = Map();
  contatoMap['nome'] = contato.nome;
  contatoMap['numeroConta'] = contato.numeroConta;
  return db.insert('contatos', contatoMap);
}

Future<List<Contato>> findAll() async {
  final Database db = await getDatabase();
    final List<Map<String, dynamic>> contatoDBs = await db.query('contatos');
      final List<Contato> contatos = List();
      for (Map<String, dynamic> contatoDB in contatoDBs) {
        final Contato contato = Contato(
          contatoDB['id'],
          contatoDB['nome'],
          contatoDB['numeroConta'],
        );
        contatos.add(contato);
      }

      return contatos;
}
