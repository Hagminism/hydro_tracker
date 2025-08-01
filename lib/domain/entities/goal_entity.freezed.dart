// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goal_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

GoalEntity _$GoalEntityFromJson(Map<String, dynamic> json) {
  return _GoalEntity.fromJson(json);
}

/// @nodoc
mixin _$GoalEntity {
  int get id => throw _privateConstructorUsedError;
  String get substance => throw _privateConstructorUsedError;
  double get targetAmount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;

  /// Serializes this GoalEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GoalEntityCopyWith<GoalEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GoalEntityCopyWith<$Res> {
  factory $GoalEntityCopyWith(
    GoalEntity value,
    $Res Function(GoalEntity) then,
  ) = _$GoalEntityCopyWithImpl<$Res, GoalEntity>;
  @useResult
  $Res call({
    int id,
    String substance,
    double targetAmount,
    String unit,
    String period,
  });
}

/// @nodoc
class _$GoalEntityCopyWithImpl<$Res, $Val extends GoalEntity>
    implements $GoalEntityCopyWith<$Res> {
  _$GoalEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? substance = null,
    Object? targetAmount = null,
    Object? unit = null,
    Object? period = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            substance: null == substance
                ? _value.substance
                : substance // ignore: cast_nullable_to_non_nullable
                      as String,
            targetAmount: null == targetAmount
                ? _value.targetAmount
                : targetAmount // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            period: null == period
                ? _value.period
                : period // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$GoalEntityImplCopyWith<$Res>
    implements $GoalEntityCopyWith<$Res> {
  factory _$$GoalEntityImplCopyWith(
    _$GoalEntityImpl value,
    $Res Function(_$GoalEntityImpl) then,
  ) = __$$GoalEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String substance,
    double targetAmount,
    String unit,
    String period,
  });
}

/// @nodoc
class __$$GoalEntityImplCopyWithImpl<$Res>
    extends _$GoalEntityCopyWithImpl<$Res, _$GoalEntityImpl>
    implements _$$GoalEntityImplCopyWith<$Res> {
  __$$GoalEntityImplCopyWithImpl(
    _$GoalEntityImpl _value,
    $Res Function(_$GoalEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? substance = null,
    Object? targetAmount = null,
    Object? unit = null,
    Object? period = null,
  }) {
    return _then(
      _$GoalEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        substance: null == substance
            ? _value.substance
            : substance // ignore: cast_nullable_to_non_nullable
                  as String,
        targetAmount: null == targetAmount
            ? _value.targetAmount
            : targetAmount // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        period: null == period
            ? _value.period
            : period // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$GoalEntityImpl implements _GoalEntity {
  const _$GoalEntityImpl({
    required this.id,
    required this.substance,
    required this.targetAmount,
    required this.unit,
    required this.period,
  });

  factory _$GoalEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$GoalEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String substance;
  @override
  final double targetAmount;
  @override
  final String unit;
  @override
  final String period;

  @override
  String toString() {
    return 'GoalEntity(id: $id, substance: $substance, targetAmount: $targetAmount, unit: $unit, period: $period)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GoalEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.substance, substance) ||
                other.substance == substance) &&
            (identical(other.targetAmount, targetAmount) ||
                other.targetAmount == targetAmount) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.period, period) || other.period == period));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, substance, targetAmount, unit, period);

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      __$$GoalEntityImplCopyWithImpl<_$GoalEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GoalEntityImplToJson(this);
  }
}

abstract class _GoalEntity implements GoalEntity {
  const factory _GoalEntity({
    required final int id,
    required final String substance,
    required final double targetAmount,
    required final String unit,
    required final String period,
  }) = _$GoalEntityImpl;

  factory _GoalEntity.fromJson(Map<String, dynamic> json) =
      _$GoalEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get substance;
  @override
  double get targetAmount;
  @override
  String get unit;
  @override
  String get period;

  /// Create a copy of GoalEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GoalEntityImplCopyWith<_$GoalEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
