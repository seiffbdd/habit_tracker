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

  Future<List<Map<String, dynamic>>> readData({required String sql}) async {
    try {
      Database? readDb = await db;
      final response = await readDb!.rawQuery(sql);
      return response;
    } catch (e) {
      debugPrint('Error from readData => $e');
      throw Exception('Error from readData => $e');
    }
  }

  Future<int> writeData({required String sql}) async {
    try {
      Database? readDb = await db;
      final response = await readDb!.rawInsert(sql);
      return response;
    } catch (e) {
      debugPrint('Error from writeData => $e');
      throw Exception('Error from writeData => $e');
    }
  }

  Future<int> updateData({required String sql}) async {
    try {
      Database? readDb = await db;
      final response = await readDb!.rawUpdate(sql);
      return response;
    } catch (e) {
      debugPrint('Error from updateData => $e');
      throw Exception('Error from updateData => $e');
    }
  }

  Future<int> deleteData({required String sql}) async {
    try {
      Database? readDb = await db;
      final response = await readDb!.rawDelete(sql);
      return response;
    } catch (e) {
      debugPrint('Error from deleteData => $e');
      throw Exception('Error from deleteData => $e');
    }
  }
}
