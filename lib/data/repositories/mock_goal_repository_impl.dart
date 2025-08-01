import '../../core/result/result.dart';
import '../../domain/entities/goal_entity.dart';
import '../../domain/repositories/goal_repository.dart';

/// Mock GoalRepository 구현체
///
/// 테스트 및 개발 단계에서 사용할 Mock 데이터를 제공합니다.
class MockGoalRepositoryImpl implements GoalRepository {
  final List<GoalEntity> _mockGoals = [
    const GoalEntity(
      id: 1,
      substance: 'water',
      targetAmount: 2000.0,
      unit: 'ml',
      period: 'daily',
    ),
    const GoalEntity(
      id: 2,
      substance: 'caffeine',
      targetAmount: 400.0,
      unit: 'mg',
      period: 'daily',
    ),
    const GoalEntity(
      id: 3,
      substance: 'alcohol',
      targetAmount: 0.0,
      unit: 'ml',
      period: 'daily',
    ),
  ];

  @override
  Future<Result<List<GoalEntity>, Exception>> getAllGoals() async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      return Result.success(_mockGoals);
    } catch (e) {
      return Result.failure(Exception('목표 조회 실패: $e'));
    }
  }

  @override
  Future<Result<GoalEntity?, Exception>> getGoalById(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      final goal = _mockGoals.where((goal) => goal.id == id).firstOrNull;
      return Result.success(goal);
    } catch (e) {
      return Result.failure(Exception('목표 조회 실패: $e'));
    }
  }

  @override
  Future<Result<GoalEntity?, Exception>> getGoalBySubstance(
    String substance,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 60));
      final goal = _mockGoals
          .where((goal) => goal.substance == substance)
          .firstOrNull;
      return Result.success(goal);
    } catch (e) {
      return Result.failure(Exception('물질별 목표 조회 실패: $e'));
    }
  }

  @override
  Future<Result<List<GoalEntity>, Exception>> getGoalsByPeriod(
    String period,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 70));
      final goals = _mockGoals.where((goal) => goal.period == period).toList();
      return Result.success(goals);
    } catch (e) {
      return Result.failure(Exception('기간별 목표 조회 실패: $e'));
    }
  }

  @override
  Future<Result<int, Exception>> addGoal(GoalEntity goal) async {
    try {
      await Future.delayed(const Duration(milliseconds: 120));
      final newId = _mockGoals.isEmpty ? 1 : (_mockGoals.last.id + 1);
      final newGoal = GoalEntity(
        id: newId,
        substance: goal.substance,
        targetAmount: goal.targetAmount,
        unit: goal.unit,
        period: goal.period,
      );
      _mockGoals.add(newGoal);
      return Result.success(newId);
    } catch (e) {
      return Result.failure(Exception('목표 추가 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> updateGoal(GoalEntity goal) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final index = _mockGoals.indexWhere((g) => g.id == goal.id);
      if (index != -1) {
        _mockGoals[index] = goal;
        return Result.success(null);
      } else {
        return Result.failure(Exception('수정할 목표를 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('목표 수정 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> deleteGoal(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 80));
      final index = _mockGoals.indexWhere((g) => g.id == id);
      if (index != -1) {
        _mockGoals.removeAt(index);
        return Result.success(null);
      } else {
        return Result.failure(Exception('삭제할 목표를 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('목표 삭제 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> deleteGoalBySubstance(
    String substance,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 70));
      final index = _mockGoals.indexWhere((g) => g.substance == substance);
      if (index != -1) {
        _mockGoals.removeAt(index);
        return Result.success(null);
      } else {
        return Result.failure(Exception('삭제할 목표를 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('물질별 목표 삭제 실패: $e'));
    }
  }

  @override
  Future<Result<Map<String, double>, Exception>> getGoalProgress() async {
    try {
      await Future.delayed(const Duration(milliseconds: 90));
      // Mock 데이터로 진행률 계산 (실제로는 ConsumptionRepository와 연동 필요)
      final progress = <String, double>{};
      for (final goal in _mockGoals) {
        // Mock 진행률: 0.0 ~ 1.0 사이의 랜덤 값
        progress[goal.substance] = 0.7; // 예시: 70% 진행
      }
      return Result.success(progress);
    } catch (e) {
      return Result.failure(Exception('목표 진행률 계산 실패: $e'));
    }
  }

  @override
  Future<Result<double, Exception>> getGoalProgressBySubstance(
    String substance,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 60));
      final goal = _mockGoals
          .where((g) => g.substance == substance)
          .firstOrNull;
      if (goal != null) {
        // Mock 진행률: 0.0 ~ 1.0 사이의 랜덤 값
        return Result.success(0.75); // 예시: 75% 진행
      } else {
        return Result.failure(Exception('해당 물질의 목표를 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('물질별 목표 진행률 계산 실패: $e'));
    }
  }

  @override
  Future<Result<bool, Exception>> hasGoal(String substance) async {
    try {
      await Future.delayed(const Duration(milliseconds: 40));
      final hasGoal = _mockGoals.any((goal) => goal.substance == substance);
      return Result.success(hasGoal);
    } catch (e) {
      return Result.failure(Exception('목표 존재 여부 확인 실패: $e'));
    }
  }
}
