import '../entities/goal_entity.dart';

/// 목표 repository 인터페이스
abstract interface class GoalRepositoryInterface {
  /// 모든 목표를 가져옵니다.
  Future<List<GoalEntity>> getAllGoals();

  /// 특정 물질의 목표를 가져옵니다.
  Future<GoalEntity?> getGoalBySubstance(String substance);

  /// 특정 기간의 목표를 가져옵니다.
  Future<List<GoalEntity>> getGoalsByPeriod(String period);

  /// 목표를 추가합니다.
  Future<int> addGoal(GoalEntity goal);

  /// 목표를 업데이트합니다.
  Future<void> updateGoal(GoalEntity goal);

  /// 목표를 삭제합니다.
  Future<void> deleteGoal(int id);

  /// 특정 물질의 목표를 삭제합니다.
  Future<void> deleteGoalBySubstance(String substance);

  /// 기본 목표를 설정합니다.
  Future<void> setDefaultGoals();

  /// 특정 물질의 기본 목표를 가져옵니다.
  GoalEntity getDefaultGoal(String substance);

  /// 모든 기본 목표를 가져옵니다.
  List<GoalEntity> getAllDefaultGoals();
}
