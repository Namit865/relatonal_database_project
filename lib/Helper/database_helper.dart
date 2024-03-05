import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DataBaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDataBase();
    return _database!;
  }

  Future<Database> initDataBase() async {
    final path = join(await getDatabasesPath(), 'news_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute(''' CREATE TABLE news(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        author TEXT,
        description TEXT,
        content TEXT,
        imageurl TEXT,
        published_time TEXT,
        name TEXT
        )
        ''');
      },
    );
  }

  Future<void> insertNews(Map<String, dynamic> news) async {
    final db = await database;
    await db.insert('news', news, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Map<String, dynamic>>> getAllNews() async {
    final db = await database;
    return await db.query('news') ?? [];
  }

  Future<void> closeDatabase() async {
    final db = await database;
    await db.close();
  }
}
