import 'package:path/path.dart';
import 'package:banco/database/dao/contato_dao.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'banco.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
       db.execute(ContatoDao.tableSql);
    },
    version: 1,
   // onDowngrade: onDatabaseDowngradeDelete,
  );
}

