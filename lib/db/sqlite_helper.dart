import 'dart:async';
import 'package:charlie/home/models/user_from_db.dart';
import 'package:charlie/home/view_models/user_view_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SqliteHelper {
  static const String dbName = 'charlie_database.db';
  static const int dbVersion = 1;
  static SqliteHelper? _instance;
  static Database? _database;

  SqliteHelper._internal();

  factory SqliteHelper() {
    if (_instance == null) {
      _instance = SqliteHelper._internal();
    }
    return _instance!;
  }

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initializeDatabase();
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    final String databasesPath = await getDatabasesPath();
    final String path = join(databasesPath, dbName);
    return await openDatabase(path, version: dbVersion, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS User (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        firstName TEXT,
        lastName TEXT,
        title TEXT,
        gender TEXT,
        age TEXT,
        dateOfBirth INTEGER,
        streetNumber TEXT,
        streetName TEXT,
        city TEXT,
        country TEXT,
        picture TEXT,
        thumbnail TEXT,
        favorite INTEGER DEFAULT 0
      )
    ''');

    await db.execute('''
      CREATE TABLE IF NOT EXISTS Favorite (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        userId INTEGER,
        FOREIGN KEY (userId) REFERENCES User(id) ON DELETE CASCADE
      )
    ''');
  }

  Future<int> insertUser(UserViewModel user) async {
    try {
      final Database db = await database;
      return db.insert('User', user.toMap());
    } catch (e) {
      return -1;
    }
  }

  Future<List<UserFromDb>> getUsers() async {
    try {
      final Database db = await database;
      final List<Map<String, dynamic>> maps = await db.query('User');
      return List.generate(maps.length, (i) => UserFromDb.fromMap(maps[i]));
    } catch (e) {
      return [];
    }
  }

  Future<int> updateUser(UserViewModel user) async {
    try {
      final Database db = await database;
      return db
          .update('User', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
    } catch (e) {
      return -1;
    }
  }

  Future<int> deleteUser(int id) async {
    try {
      final Database db = await database;
      return await db.delete('User', where: 'id = ?', whereArgs: [id]);
    } catch (e) {
      return -1;
    }
  }

  Future<UserFromDb?> searchUser(int id) async {
    try {
      final Database db = await database;
      final List<Map<String, dynamic>> maps = await db.query(
        'User',
        where: 'id = ?',
        whereArgs: [id],
      );
      if (maps.isNotEmpty) {
        return UserFromDb.fromMap(maps.first);
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  Future<int> favoriteUser(int userId) async {
    try {
      final Database db = await database;
      return await db.insert('Favorite', {'userId': userId});
    } catch (e) {
      return -1;
    }
  }

  Future<int> unfavoriteUser(int userId) async {
    try {
      final Database db = await database;
      return await db
          .delete('Favorite', where: 'userId = ?', whereArgs: [userId]);
    } catch (e) {
      return -1;
    }
  }

  Future<List<UserFromDb>> getFavoriteUsers() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT User.* FROM User
      INNER JOIN Favorite ON User.id = Favorite.userId
    ''');
    return List.generate(maps.length, (i) => UserFromDb.fromMap(maps[i]));
  }
}
