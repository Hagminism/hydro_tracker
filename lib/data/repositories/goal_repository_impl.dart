import 'package:sqflite/sqflite.dart';
import '../../core/exceptions/database_exception.dart' as hydro_exceptions;
import '../../domain/entities/goal_entity.dart';
import '../../domain/repositories/goal_repository_interface.dart';
import '../datasources/local/database_helper.dart';

/// GoalRepository의 실제 구현체
/// sqflite를 사용하여 로컬 SQLite 데이터베이스와 상호작용합니다.
class GoalRepositoryImpl implements GoalRepositoryInterface {
  const GoalRepositoryImpl();

  @override
  Future<List<GoalEntity>> getAllGoals() async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'goals',
        orderBy: 'substance ASC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('목표 조회 실패', e.toString());
    }
  }

  @override
  Future<GoalEntity?> getGoalBySubstance(String substance) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'goals',
        where: 'substance = ?',
        whereArgs: [substance],
        limit: 1,
      );

      if (maps.isEmpty) {
        return null;
      }

      return _mapToEntity(maps.first);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질별 목표 조회 실패', e.toString());
    }
  }

  @override
  Future<List<GoalEntity>> getGoalsByPeriod(String period) async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'goals',
        where: 'period = ?',
        whereArgs: [period],
        orderBy: 'substance ASC',
      );

      return maps.map((map) => _mapToEntity(map)).toList();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('기간별 목표 조회 실패', e.toString());
    }
  }

  @override
  Future<int> addGoal(GoalEntity goal) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(goal);
      
      // id 필드 제거 (자동 생성)
      map.remove('id');

      return await db.insert('goals', map);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('목표 추가 실패', e.toString());
    }
  }

  @override
  Future<void> updateGoal(GoalEntity goal) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(goal);
      
      // updated_at 필드 업데이트
      map['updated_at'] = DateTime.now().toIso8601String();

      final count = await db.update(
        'goals',
        map,
        where: 'id = ?',
        whereArgs: [goal.id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('업데이트할 목표를 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('목표 수정 실패', e.toString());
    }
  }

  @override
  Future<void> deleteGoal(int id) async {
    try {
      final db = await DatabaseHelper.database;
      final count = await db.delete(
        'goals',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('삭제할 목표를 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('목표 삭제 실패', e.toString());
    }
  }

  @override
  Future<void> deleteGoalBySubstance(String substance) async {
    try {
      final db = await DatabaseHelper.database;
      final count = await db.delete(
        'goals',
        where: 'substance = ?',
        whereArgs: [substance],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('삭제할 목표를 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('물질별 목표 삭제 실패', e.toString());
    }
  }

  @override
  Future<Map<String, GoalEntity>> getAllGoalsAsMap() async {
    try {
      final goals = await getAllGoals();
      final Map<String, GoalEntity> goalsMap = {};
      
      for (final goal in goals) {
        goalsMap[goal.substance] = goal;
      }

      return goalsMap;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('목표 맵 조회 실패', e.toString());
    }
  }

  @override
  Future<void> setDefaultGoals() async {
    try {
      final db = await DatabaseHelper.database;
      
      // 기존 기본 목표 삭제
      await db.delete('goals');
      
      // 기본 목표 추가
      final defaultGoals = getAllDefaultGoals();
      for (final goal in defaultGoals) {
        await addGoal(goal);
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('기본 목표 설정 실패', e.toString());
    }
  }

  @override
  GoalEntity getDefaultGoal(String substance) {
    final defaultGoals = getAllDefaultGoals();
    return defaultGoals.firstWhere(
      (goal) => goal.substance == substance,
      orElse: () => throw hydro_exceptions.HydroTrackerDatabaseException('기본 목표를 찾을 수 없습니다: $substance'),
    );
  }

  @override
  List<GoalEntity> getAllDefaultGoals() {
    return [
      const GoalEntity(
        id: 0,
        substance: 'water',
        targetAmount: 2.0,
        unit: 'L',
        period: 'daily',
      ),
      const GoalEntity(
        id: 0,
        substance: 'caffeine',
        targetAmount: 400.0,
        unit: 'mg',
        period: 'daily',
      ),
      const GoalEntity(
        id: 0,
        substance: 'alcohol',
        targetAmount: 0.0,
        unit: 'drinks',
        period: 'daily',
      ),
      const GoalEntity(
        id: 0,
        substance: 'nicotine',
        targetAmount: 0.0,
        unit: 'cigarettes',
        period: 'daily',
      ),
    ];
  }

  /// Map을 GoalEntity로 변환합니다.
  GoalEntity _mapToEntity(Map<String, dynamic> map) {
    return GoalEntity(
      id: map['id'] as int,
      substance: map['substance'] as String,
      targetAmount: map['target_amount'] as double,
      unit: map['unit'] as String,
      period: map['period'] as String,
    );
  }

  /// GoalEntity를 Map으로 변환합니다.
  Map<String, dynamic> _entityToMap(GoalEntity entity) {
    return {
      'id': entity.id,
      'substance': entity.substance,
      'target_amount': entity.targetAmount,
      'unit': entity.unit,
      'period': entity.period,
    };
  }
} 