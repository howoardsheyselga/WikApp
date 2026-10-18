import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:wikapp_beta/models/quiz_history_model.dart';

class QuizDatabaseHelper {
  static const String _dbName = 'wikapp_quiz_history.db';
  static const int _dbVersion = 1;
  static const String tableHistory = 'quiz_history';

  // Singleton instance
  QuizDatabaseHelper._privateConstructor();
  static final QuizDatabaseHelper instance = QuizDatabaseHelper._privateConstructor();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, _dbName);

    return await openDatabase(
      path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableHistory (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        paksa_title TEXT NOT NULL,
        activity_type TEXT NOT NULL,
        score INTEGER NOT NULL,
        total_questions INTEGER NOT NULL,
        timestamp TEXT NOT NULL,
        review_items_json TEXT NOT NULL
      )
    ''');
  }

  // INSERT Record (CREATE)
  Future<int> insertHistoryRecord(QuizHistoryModel record) async {
    final db = await database;
    return await db.insert(
      tableHistory,
      record.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // FETCH All History Records (READ)
  Future<List<QuizHistoryModel>> getAllHistoryRecords() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableHistory,
      orderBy: 'timestamp DESC',
    );

    return List.generate(maps.length, (i) => QuizHistoryModel.fromMap(maps[i]));
  }

  // FETCH History Records filtered by Paksa Title
  Future<List<QuizHistoryModel>> getHistoryByPaksa(String paksaTitle) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      tableHistory,
      where: 'paksa_title = ?',
      whereArgs: [paksaTitle],
      orderBy: 'timestamp DESC',
    );

    return List.generate(maps.length, (i) => QuizHistoryModel.fromMap(maps[i]));
  }

  // DELETE single record by ID
  Future<int> deleteHistoryRecord(int id) async {
    final db = await database;
    return await db.delete(
      tableHistory,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // CLEAR all history
  Future<int> clearAllHistory() async {
    final db = await database;
    return await db.delete(tableHistory);
  }
}