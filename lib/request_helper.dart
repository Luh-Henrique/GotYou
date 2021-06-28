import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_gotyou/request.dart';

class RequestHelper {
  static final RequestHelper _instance = RequestHelper.internal();

  factory RequestHelper() => _instance;

  RequestHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "GotYou.db");

    return openDatabase(path, version: 1,
    onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE request("
          "id INTEGER PRIMARY KEY, "
          "requester TEXT, "
          "description TEXT, "
          "items TEXT, "
          "done INTEGER, "
          "location TEXT)");
    });
  }

  Future<Request> save(Request request) async {
    Database database = await db;
    request.id = await database.insert('request', request.toMap());
    return request;
  }

  Future<Request> getById(int id) async {
    Database database = await db;
    List<Map> maps = await database.query('request',
        columns: ['id', 'requester', 'description', 'items', 'done', 'location'],
        where: 'id = ?',
        whereArgs: [id]);

    if (maps.length > 0) {
      return Request.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<Request>> getAll() async {
    Database database = await db;
    List listMap = await database.rawQuery("SELECT * FROM request");
    List<Request> stuffList = listMap.map((x) => Request.fromMap(x)).toList();
    return stuffList;
  }

  Future<int> update(Request request) async {
    Database database = await db;
    return await database
        .update('request', request.toMap(), where: 'id = ?', whereArgs: [request.id]);
  }

  Future<int> delete(int id) async {
    Database database = await db;
    return await database.delete('request', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> deleteAll() async {
    Database database = await db;
    return await database.rawDelete("DELETE * from request");
  }
}