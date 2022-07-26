import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final fullPath = join(dbPath, "/bytebank.db");

  return openDatabase(
    fullPath,
    onCreate: (db, version) async {
      await db.execute("CREATE TABLE contacts ("
          "id integer PRIMARY KEY,"
          "full_name TEXT,"
          "account_branch VARCHAR(4),"
          "account_number VARCHAR(255)");
    },
    version: 1,
  );
}