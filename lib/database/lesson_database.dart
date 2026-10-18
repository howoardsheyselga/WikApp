import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class LessonDatabase {
  static final LessonDatabase instance = LessonDatabase._init();
  static Database? _database;

  LessonDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('wikapp_progress.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE lesson_state (
        id TEXT PRIMARY KEY,
        progress REAL NOT NULL DEFAULT 0.0,
        is_bookmarked INTEGER NOT NULL DEFAULT 0,
        updated_at TEXT NOT NULL
      )
    ''');
  }

  /// Get progress and bookmark status for a specific Paksa by ID
  Future<Map<String, dynamic>?> getLessonState(String lessonId) async {
    final db = await instance.database;
    final maps = await db.query(
      'lesson_state',
      columns: ['progress', 'is_bookmarked'],
      where: 'id = ?',
      whereArgs: [lessonId],
    );

    if (maps.isNotEmpty) {
      return maps.first;
    }
    return null;
  }

  /// Update reading progress in SQLite
  Future<void> updateProgress(String lessonId, double newProgress) async {
    final db = await instance.database;
    final clampedProgress = newProgress.clamp(0.0, 1.0);

    await db.insert(
      'lesson_state',
      {
        'id': lessonId,
        'progress': clampedProgress,
        'updated_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /// Toggle bookmark status in SQLite
  Future<bool> toggleBookmark(String lessonId) async {
    final db = await instance.database;
    final currentState = await getLessonState(lessonId);

    final bool currentBookmarked = currentState != null
        ? (currentState['is_bookmarked'] as int) == 1
        : false;
    final double currentProgress = currentState != null
        ? (currentState['progress'] as num).toDouble()
        : 0.0;

    final bool newBookmarkStatus = !currentBookmarked;

    await db.insert(
      'lesson_state',
      {
        'id': lessonId,
        'progress': currentProgress,
        'is_bookmarked': newBookmarkStatus ? 1 : 0,
        'updated_at': DateTime.now().toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    return newBookmarkStatus;
  }
}