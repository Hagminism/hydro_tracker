import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

/// SQLite 데이터베이스 헬퍼 클래스
/// HydroTracker 앱의 로컬 데이터베이스를 관리합니다.
class DatabaseHelper {
  static Database? _database;
  static const int _version = 1;
  static const String _databaseName = 'hydro_tracker.db';

  /// 데이터베이스 인스턴스를 반환합니다.
  /// 싱글톤 패턴으로 구현되어 있습니다.
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  /// 데이터베이스를 초기화합니다.
  static Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, _databaseName);

    return await openDatabase(
      dbPath,
      version: _version,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }

  /// 데이터베이스 생성 시 호출되는 콜백
  static Future<void> _onCreate(Database db, int version) async {
    // consumption_records 테이블 생성
    await db.execute('''
      CREATE TABLE consumption_records (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        substance TEXT NOT NULL,
        amount REAL NOT NULL,
        unit TEXT NOT NULL,
        timestamp DATETIME NOT NULL,
        memo TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // goals 테이블 생성
    await db.execute('''
      CREATE TABLE goals (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        substance TEXT NOT NULL,
        target_amount REAL NOT NULL,
        unit TEXT NOT NULL,
        period TEXT NOT NULL,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // user_settings 테이블 생성
    await db.execute('''
      CREATE TABLE user_settings (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        dark_mode BOOLEAN DEFAULT FALSE,
        language TEXT DEFAULT 'ko',
        notifications BOOLEAN DEFAULT TRUE,
        notification_settings TEXT,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
      )
    ''');

    // 인덱스 생성
    await db.execute('''
      CREATE INDEX idx_consumption_records_substance 
      ON consumption_records(substance)
    ''');

    await db.execute('''
      CREATE INDEX idx_consumption_records_timestamp 
      ON consumption_records(timestamp)
    ''');

    await db.execute('''
      CREATE INDEX idx_goals_substance 
      ON goals(substance)
    ''');

    // 기본 목표 데이터 삽입
    await _insertDefaultGoals(db);
  }

  /// 데이터베이스 업그레이드 시 호출되는 콜백
  static Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    // 향후 마이그레이션 로직을 여기에 추가
    if (oldVersion < 2) {
      // 버전 2 마이그레이션 로직
    }
  }

  /// 기본 목표 데이터를 삽입합니다.
  static Future<void> _insertDefaultGoals(Database db) async {
    final defaultGoals = [
      {
        'substance': 'water',
        'target_amount': 2.0,
        'unit': 'L',
        'period': 'daily',
      },
      {
        'substance': 'caffeine',
        'target_amount': 400.0,
        'unit': 'mg',
        'period': 'daily',
      },
      {
        'substance': 'alcohol',
        'target_amount': 0.0,
        'unit': 'drinks',
        'period': 'daily',
      },
      {
        'substance': 'nicotine',
        'target_amount': 0.0,
        'unit': 'cigarettes',
        'period': 'daily',
      },
    ];

    for (final goal in defaultGoals) {
      await db.insert('goals', goal);
    }
  }

  /// 데이터베이스를 닫습니다.
  static Future<void> close() async {
    final db = await database;
    await db.close();
    _database = null;
  }

  /// 데이터베이스를 삭제합니다. (테스트용)
  static Future<void> deleteDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, _databaseName);
    await databaseFactory.deleteDatabase(dbPath);
    _database = null;
  }
} 