import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteHelper {
  static final SqliteHelper _instance = SqliteHelper._internal();
  static Database? _database;

  factory SqliteHelper() {
    return _instance;
  }

  SqliteHelper._internal();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    final path = await getDatabasesPath();
    final databasePath = join(path, 'charlie_database.db');

    return openDatabase(databasePath, version: 1, onCreate: _createDatabase);
  }

  Future<void> _createDatabase(Database db, int version) async {
    await db.execute('''
      CREATE TABLE User(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        title TEXT,
        gender TEXT,
        age TEXT,
        dateOfBirth TEXT,
        streetNumber TEXT,
        streetName TEXT,
        city TEXT,
        country TEXT,
        picture TEXT,
        thumbnail TEXT
      )
      ''');
  }

  Future<List<Map<String, dynamic>>> getUsers() async {
    final db = await database;
    return db.query('User');
  }

  Future<void> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    await db.insert('User', user);
  }

  Future<void> updateUser(int id, Map<String, dynamic> updatedUser) async {
    final db = await database;
    await db.update('User', updatedUser, where: 'id = ?', whereArgs: [id]);
  }

  Future<void> deleteUser(int id) async {
    final db = await database;
    await db.delete('User', where: 'id = ?', whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> searchUser(String query) async {
    final db = await database;
    return db.query('User', where: 'firstName LIKE ?', whereArgs: ['%$query%']);
  }
}
