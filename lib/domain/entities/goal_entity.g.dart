// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goal_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GoalEntityImpl _$$GoalEntityImplFromJson(Map<String, dynamic> json) =>
    _$GoalEntityImpl(
      id: (json['id'] as num).toInt(),
      substance: json['substance'] as String,
      targetAmount: (json['targetAmount'] as num).toDouble(),
      unit: json['unit'] as String,
      period: json['period'] as String,
    );

Map<String, dynamic> _$$GoalEntityImplToJson(_$GoalEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'substance': instance.substance,
      'targetAmount': instance.targetAmount,
      'unit': instance.unit,
      'period': instance.period,
    };
