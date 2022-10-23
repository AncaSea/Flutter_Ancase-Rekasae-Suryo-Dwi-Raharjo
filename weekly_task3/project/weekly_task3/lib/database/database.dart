import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/user_model.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static late Database _database;
  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDb();
    return _database;
  }

  final String _tableName = 'dataUsers';

  Future<Database> _initializeDb() async {
    var db = openDatabase(
      join(await getDatabasesPath(), 'dataUser_db.db'),
      onCreate: (db, version) async {
        await db.execute(
          '''CREATE TABLE $_tableName(
            id TEXT PRIMARY KEY,
            firstName TEXT,
            lastName TEXT,
            email TEXT,
            message TEXT
        )''',
        );
      },
      version: 1,
    );
    return db;
  }

  Future<void> insertDataUser(DataUser dataUser) async {
    final Database db = await database;
    await db.insert(_tableName, dataUser.toMap());
  }

  Future<List<DataUser>> getDataUsers() async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(_tableName);
    return results.map((e) => DataUser.fromMap(e)).toList();
  }

  Future<DataUser> getDataUserById(String id) async {
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
    return results.map((e) => DataUser.fromMap(e)).first;
  }

  Future<void> updateDataUser(DataUser dataUser) async {
    final db = await database;
    await db.update(
      _tableName,
      dataUser.toMap(),
      where: 'id = ?',
      whereArgs: [dataUser.id],
    );
  }

  Future<void> deleteDataUser(String id) async {
    final db = await database;
    await db.delete(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
