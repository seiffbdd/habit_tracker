import 'package:flutter/material.dart';
import 'package:habit_tracker/core/constants/app_strings.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _db;
  static const int version = 1;
  static const String habitTrackerDb = 'habit_tracker.db';
  static const String habitTable = 'Habit';
  static const String repeatDayTable = 'RepeatDay';
  static const String dailyGoalTable = 'DailyGoal';

  Future<Database?> get db async {
    if (_db == null) {
      await initialDb();
      return _db;
    } else {
      return _db;
    }
  }

  Future<void> initialDb() async {
    try {
      String databasePath = await getDatabasesPath();
      String path = join(databasePath, habitTrackerDb);
      _db = await openDatabase(
        path,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        version: 1,
      );
    } catch (e) {
      debugPrint('Error from initialDb => $e');
      throw Exception('Error from initialDb => $e');
    }
  }

  Future<void> _onCreate(Database createDb, int version) async {
    await createDb.execute('''
    CREATE TABLE $habitTable (
      ${AppStrings.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AppStrings.name} TEXT NOT NULL,
      ${AppStrings.content} TEXT,
      ${AppStrings.content} TEXT NOT NULL,
      ${AppStrings.color} INTEGER NOT NULL,
      ${AppStrings.time} TEXT NOT NULL,
      ${AppStrings.timeOfRemind} TEXT,
      ${AppStrings.endDate} TEXT
    )
    ''');
    await createDb.execute('''
    CREATE TABLE $repeatDayTable (
      ${AppStrings.day} PRIMARY KEY,
      ${AppStrings.habitID} INTEGER NOT NULL,
      FOREIGN KEY (${AppStrings.habitID}) REFERENCES $habitTable(${AppStrings.id}) ON DELETE CASCADE
    )
    ''');
    await createDb.execute('''
    CREATE TABLE $dailyGoalTable (
      ${AppStrings.id} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${AppStrings.goalType} TEXT NOT NULL,
      ${AppStrings.durationSecs} INTEGER,
      ${AppStrings.reps} INTEGER,
      ${AppStrings.habitID} INTEGER NOT NULL,
      FOREIGN KEY (${AppStrings.habitID}) REFERENCES $habitTable(${AppStrings.id}) ON DELETE CASCADE
    )
    ''');

    debugPrint('=============Database created============');
  }

  Future<void> _onUpgrade(
    Database upgradeDb,
    int oldVersion,
    int newVersion,
  ) async {}

  Future<int> insertData({
    required String table,
    required Map<String, dynamic> values,
    ConflictAlgorithm conflictAlgorithm = ConflictAlgorithm.ignore,
  }) async {
    final dbClient = await db;
    return await dbClient!.insert(
      table,
      values,
      conflictAlgorithm: conflictAlgorithm,
    );
  }

  Future<List<Map<String, dynamic>>> query({
    required String table,
    String? where,
    List<Object?>? whereArgs,
    List<String>? columns,
    String? orderBy,
  }) async {
    final dbClient = await db;
    return await dbClient!.query(
      table,
      where: where,
      whereArgs: whereArgs,
      columns: columns,
      orderBy: orderBy,
    );
  }

  Future<int> update({
    required String table,
    required Map<String, dynamic> values,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final dbClient = await db;
    return await dbClient!.update(
      table,
      values,
      where: where,
      whereArgs: whereArgs,
    );
  }

  Future<int> delete({
    required String table,
    required String where,
    required List<Object?> whereArgs,
  }) async {
    final dbClient = await db;
    return await dbClient!.delete(table, where: where, whereArgs: whereArgs);
  }
}
