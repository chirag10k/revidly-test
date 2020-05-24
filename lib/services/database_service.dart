import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:revidlytest/models/post_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {

  static Database _database;

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Post table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'revidly_posts.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Posts('
              'title TEXT,'
              'author TEXT,'
              'topic TEXT,'
              'description TEXT,'
              'avatar TEXT,'
              'image TEXT,'
              'upvotes TEXT,'
              'downvotes TEXT,'
              'comments TEXT'
              ')');
        });
  }

  // Insert Posts in database
  createPostList(List<Post> postList) async {
    await deleteAllPosts();
    final db = await database;
    var res;
    for(int i = 0; i < postList.length; i++){
      res = await db.insert('Posts', postList[i].toMap());
    }
  }

  // Delete all posts
  Future<int> deleteAllPosts() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Posts');

    return res;
  }

  Future<List<Post>> getAllPosts() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM POSTS ");
//    print(res);
    List<Post> list = [];
    for(var c in res.toList()){
      list.add(Post.fromMap(c));
    }
//    list = res.isNotEmpty
//        ? res.map((c) => Post.fromMap(c)).toList()
//        : [];
//    print(list.length);
    offlineFetchedList = list;
    return offlineFetchedList;
  }


}