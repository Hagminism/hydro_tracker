import 'package:sqflite/sqflite.dart';
import '../../core/exceptions/database_exception.dart' as hydro_exceptions;
import '../../domain/entities/consumption_record_entity.dart';
import '../../domain/repositories/consumption_repository_interface.dart';
import '../datasources/local/database_helper.dart';

/// ConsumptionRepository의 실제 구현체
/// sqflite를 사용하여 로컬 SQLite 데이터베이스와 상호작용합니다.
class ConsumptionRepositoryImpl implements ConsumptionRepositoryInterface {
  const ConsumptionRepositoryImpl();

  @override
  Future<List<ConsumptionRecordEntity>> getAllRecords() async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        orderBy: 'timestamp DESC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecordsByDate(DateTime date) async {
    try {
      final db = await DatabaseHelper.database;
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        where: 'timestamp >= ? AND timestamp < ?',
        whereArgs: [startOfDay.toIso8601String(), endOfDay.toIso8601String()],
        orderBy: 'timestamp DESC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('날짜별 섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        where: 'timestamp >= ? AND timestamp <= ?',
        whereArgs: [startDate.toIso8601String(), endDate.toIso8601String()],
        orderBy: 'timestamp DESC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('기간별 섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecordsBySubstance(String substance) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        where: 'substance = ?',
        whereArgs: [substance],
        orderBy: 'timestamp DESC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질별 섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecordsBySubstanceAndDate(
    String substance,
    DateTime date,
  ) async {
    try {
      final db = await DatabaseHelper.database;
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        where: 'substance = ? AND timestamp >= ? AND timestamp < ?',
        whereArgs: [substance, startOfDay.toIso8601String(), endOfDay.toIso8601String()],
        orderBy: 'timestamp DESC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질 및 날짜별 섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<int> addRecord(ConsumptionRecordEntity record) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(record);
      
      // id 필드 제거 (자동 생성)
      map.remove('id');

      return await db.insert('consumption_records', map);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('섭취 기록 추가 실패', e.toString());
    }
  }

  @override
  Future<void> updateRecord(ConsumptionRecordEntity record) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(record);
      
      // updated_at 필드 업데이트
      map['updated_at'] = DateTime.now().toIso8601String();

      final count = await db.update(
        'consumption_records',
        map,
        where: 'id = ?',
        whereArgs: [record.id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('업데이트할 기록을 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('섭취 기록 수정 실패', e.toString());
    }
  }

  @override
  Future<void> deleteRecord(int id) async {
    try {
      final db = await DatabaseHelper.database;
      final count = await db.delete(
        'consumption_records',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('삭제할 기록을 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('섭취 기록 삭제 실패', e.toString());
    }
  }

  @override
  Future<Map<String, double>> getTotalConsumptionByDate(DateTime date) async {
    try {
      final db = await DatabaseHelper.database;
      final startOfDay = DateTime(date.year, date.month, date.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final List<Map<String, dynamic>> result = await db.rawQuery('''
        SELECT substance, SUM(amount) as total
        FROM consumption_records
        WHERE timestamp >= ? AND timestamp < ?
        GROUP BY substance
      ''', [startOfDay.toIso8601String(), endOfDay.toIso8601String()]);

      final Map<String, double> totals = {};
      for (final row in result) {
        totals[row['substance'] as String] = row['total'] as double? ?? 0.0;
      }

      return totals;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('총 섭취량 조회 실패', e.toString());
    }
  }

  @override
  Future<Map<String, double>> getTotalConsumptionByDateRange(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> result = await db.rawQuery('''
        SELECT substance, SUM(amount) as total
        FROM consumption_records
        WHERE timestamp >= ? AND timestamp <= ?
        GROUP BY substance
      ''', [startDate.toIso8601String(), endDate.toIso8601String()]);

      final Map<String, double> totals = {};
      for (final row in result) {
        totals[row['substance'] as String] = row['total'] as double? ?? 0.0;
      }

      return totals;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('기간별 총 섭취량 조회 실패', e.toString());
    }
  }

  @override
  Future<double> getTotalConsumptionBySubstanceAndDateRange(
    String substance,
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> result = await db.rawQuery('''
        SELECT SUM(amount) as total
        FROM consumption_records
        WHERE substance = ? AND timestamp >= ? AND timestamp <= ?
      ''', [substance, startDate.toIso8601String(), endDate.toIso8601String()]);

      return result.first['total'] as double? ?? 0.0;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질별 총 섭취량 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecentRecords({int limit = 10}) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        orderBy: 'timestamp DESC',
        limit: limit,
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('최근 섭취 기록 조회 실패', e.toString());
    }
  }

  @override
  Future<List<ConsumptionRecordEntity>> getRecentRecordsBySubstance(
    String substance, {
    int limit = 10,
  }) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'consumption_records',
        where: 'substance = ?',
        whereArgs: [substance],
        orderBy: 'timestamp DESC',
        limit: limit,
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질별 최근 섭취 기록 조회 실패', e.toString());
    }
  }

  /// Map을 ConsumptionRecordEntity로 변환합니다.
  ConsumptionRecordEntity _mapToEntity(Map<String, dynamic> map) {
    return ConsumptionRecordEntity(
      id: map['id'] as int,
      substance: map['substance'] as String,
      amount: map['amount'] as double,
      unit: map['unit'] as String,
      timestamp: DateTime.parse(map['timestamp'] as String),
      memo: map['memo'] as String?,
    );
  }

  /// ConsumptionRecordEntity를 Map으로 변환합니다.
  Map<String, dynamic> _entityToMap(ConsumptionRecordEntity entity) {
    return {
      'id': entity.id,
      'substance': entity.substance,
      'amount': entity.amount,
      'unit': entity.unit,
      'timestamp': entity.timestamp.toIso8601String(),
      'memo': entity.memo,
    };
  }
} 