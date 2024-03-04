import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'blog.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE blog_posts(id INTEGER PRIMARY KEY, title TEXT, content TEXT, date TEXT)',
        );
      },
    );
  }

  Future<int> insertBlogPost(Map<String, dynamic> blogPost) async {
    return await _database.insert('blog_posts', blogPost);
  }

  Future<List<Map<String, dynamic>>> getBlogPosts() async {
    return await _database.query('blog_posts');
  }

  Future<void> updateBlogPost(Map<String, dynamic> blogPost) async {
    await _database.update(
      'blog_posts',
      blogPost,
      where: 'id = ?',
      whereArgs: [blogPost['id']],
    );
  }

  Future<void> deleteBlogPost(int id) async {
    await _database.delete('blog_posts', where: 'id = ?', whereArgs: [id]);
  }
}
