// ignore_for_file: unused_element, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, avoid_print, void_checks, await_only_futures, depend_on_referenced_packages, unnecessary_import

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';
import 'package:projeto_ambisis/database/script.dart';

class DB {
  static Database? _db;

  static Future<Database> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'metaEsg.db');
      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) async {
          db.execute(creatTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
          db.execute(insert4);
          db.execute(insert5);
          db.execute(insert6);
          db.execute(insert7);
          db.execute(insert8);
          db.execute(insert9);
          db.execute(insert10);
        },
      );
    }
    return _db!;
  }
}
