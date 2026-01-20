import 'package:mobile_mid_mock/models/todo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static DatabaseHelper get instance => _instance;

  DatabaseHelper._internal();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    // Get the path to the database file
    String path = join(await getDatabasesPath(), 'todo_database.db');

    // Open/create the database
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    // Create the tables
    await db.execute('''
      CREATE TABLE todos(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        status TEXT
      )
    ''');
  }

  Future<int> insertTodo(Todo todo) async {
    final db = await instance.database;
    return await db.insert('todos', todo.toMap());
  }

  Future<List<Todo>> getAllTodos() async {
    Database db = await instance.database;
    List<Map<String, dynamic>> maps = await db.query('todos');
    return List.generate(maps.length, (i) {
      return Todo.fromMap(maps[i]);
    });
  }

  Future<int> updateTodo(Todo todo) async {
    final db = await instance.database;
    print(todo);
    return await db.update(
      'todos',
      todo.toMap(),
      where: 'id = ?',
      whereArgs: [todo.id],
    );
  }

  Future<int> deleteTodo(int id) async {
    final db = await instance.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
