import '../../core/result/result.dart';
import '../entities/goal_entity.dart';

/// 목표 Repository 인터페이스
///
/// 목표 설정의 CRUD 작업을 담당합니다.
abstract interface class GoalRepository {
  /// 모든 목표를 조회합니다.
  Future<Result<List<GoalEntity>, Exception>> getAllGoals();

  /// 특정 ID의 목표를 조회합니다.
  Future<Result<GoalEntity?, Exception>> getGoalById(int id);

  /// 특정 물질의 목표를 조회합니다.
  Future<Result<GoalEntity?, Exception>> getGoalBySubstance(String substance);

  /// 특정 기간의 목표를 조회합니다.
  Future<Result<List<GoalEntity>, Exception>> getGoalsByPeriod(String period);

  /// 목표를 추가합니다.
  Future<Result<int, Exception>> addGoal(GoalEntity goal);

  /// 목표를 수정합니다.
  Future<Result<void, Exception>> updateGoal(GoalEntity goal);

  /// 목표를 삭제합니다.
  Future<Result<void, Exception>> deleteGoal(int id);

  /// 특정 물질의 목표를 삭제합니다.
  Future<Result<void, Exception>> deleteGoalBySubstance(String substance);

  /// 목표 달성률을 계산합니다.
  Future<Result<Map<String, double>, Exception>> getGoalProgress();

  /// 특정 물질의 목표 달성률을 계산합니다.
  Future<Result<double, Exception>> getGoalProgressBySubstance(
    String substance,
  );

  /// 목표가 설정되어 있는지 확인합니다.
  Future<Result<bool, Exception>> hasGoal(String substance);
}
