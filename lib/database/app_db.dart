import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  final dbPath = await getDatabasesPath();
  final fullPath = join(dbPath, "bytebank.db");

  return openDatabase(
    fullPath,
    onCreate: (db, version) async {
      await db.execute("CREATE TABLE contact ("
          "id integer PRIMARY KEY,"
          "full_name TEXT NOT NULL,"
          "account_branch VARCHAR(4) NOT NULL,"
          "account_number VARCHAR(255) NOT NULL)");
    },
    version: 1,
  );
}