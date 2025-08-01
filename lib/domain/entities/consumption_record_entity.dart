import 'package:freezed_annotation/freezed_annotation.dart';

part 'consumption_record_entity.freezed.dart';
part 'consumption_record_entity.g.dart';

/// 섭취 기록 엔티티
///
/// 사용자가 섭취한 물질의 기록을 나타냅니다.
@freezed
class ConsumptionRecordEntity with _$ConsumptionRecordEntity {
  const factory ConsumptionRecordEntity({
    required int id,
    required String substance, // 'water', 'caffeine', 'alcohol', 'nicotine'
    required double amount,
    required String unit,
    required DateTime timestamp,
    String? memo,
  }) = _ConsumptionRecordEntity;

  factory ConsumptionRecordEntity.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRecordEntityFromJson(json);
}
