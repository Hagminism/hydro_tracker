import 'package:freezed_annotation/freezed_annotation.dart';

part 'goal_entity.freezed.dart';
part 'goal_entity.g.dart';

/// 목표 엔티티
///
/// 사용자가 설정한 섭취 목표를 나타냅니다.
@freezed
class GoalEntity with _$GoalEntity {
  const factory GoalEntity({
    required int id,
    required String substance,
    required double targetAmount,
    required String unit,
    required String period, // 'daily', 'weekly', 'monthly'
  }) = _GoalEntity;

  factory GoalEntity.fromJson(Map<String, dynamic> json) =>
      _$GoalEntityFromJson(json);
}
