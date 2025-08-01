// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'consumption_record_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConsumptionRecordEntityImpl _$$ConsumptionRecordEntityImplFromJson(
  Map<String, dynamic> json,
) => _$ConsumptionRecordEntityImpl(
  id: (json['id'] as num).toInt(),
  substance: json['substance'] as String,
  amount: (json['amount'] as num).toDouble(),
  unit: json['unit'] as String,
  timestamp: DateTime.parse(json['timestamp'] as String),
  memo: json['memo'] as String?,
);

Map<String, dynamic> _$$ConsumptionRecordEntityImplToJson(
  _$ConsumptionRecordEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'substance': instance.substance,
  'amount': instance.amount,
  'unit': instance.unit,
  'timestamp': instance.timestamp.toIso8601String(),
  'memo': instance.memo,
};
