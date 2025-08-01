// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consumption_record_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ConsumptionRecordEntity _$ConsumptionRecordEntityFromJson(
  Map<String, dynamic> json,
) {
  return _ConsumptionRecordEntity.fromJson(json);
}

/// @nodoc
mixin _$ConsumptionRecordEntity {
  int get id => throw _privateConstructorUsedError;
  String get substance =>
      throw _privateConstructorUsedError; // 'water', 'caffeine', 'alcohol', 'nicotine'
  double get amount => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get memo => throw _privateConstructorUsedError;

  /// Serializes this ConsumptionRecordEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsumptionRecordEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsumptionRecordEntityCopyWith<ConsumptionRecordEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsumptionRecordEntityCopyWith<$Res> {
  factory $ConsumptionRecordEntityCopyWith(
    ConsumptionRecordEntity value,
    $Res Function(ConsumptionRecordEntity) then,
  ) = _$ConsumptionRecordEntityCopyWithImpl<$Res, ConsumptionRecordEntity>;
  @useResult
  $Res call({
    int id,
    String substance,
    double amount,
    String unit,
    DateTime timestamp,
    String? memo,
  });
}

/// @nodoc
class _$ConsumptionRecordEntityCopyWithImpl<
  $Res,
  $Val extends ConsumptionRecordEntity
>
    implements $ConsumptionRecordEntityCopyWith<$Res> {
  _$ConsumptionRecordEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsumptionRecordEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? substance = null,
    Object? amount = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? memo = freezed,
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
            amount: null == amount
                ? _value.amount
                : amount // ignore: cast_nullable_to_non_nullable
                      as double,
            unit: null == unit
                ? _value.unit
                : unit // ignore: cast_nullable_to_non_nullable
                      as String,
            timestamp: null == timestamp
                ? _value.timestamp
                : timestamp // ignore: cast_nullable_to_non_nullable
                      as DateTime,
            memo: freezed == memo
                ? _value.memo
                : memo // ignore: cast_nullable_to_non_nullable
                      as String?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ConsumptionRecordEntityImplCopyWith<$Res>
    implements $ConsumptionRecordEntityCopyWith<$Res> {
  factory _$$ConsumptionRecordEntityImplCopyWith(
    _$ConsumptionRecordEntityImpl value,
    $Res Function(_$ConsumptionRecordEntityImpl) then,
  ) = __$$ConsumptionRecordEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    String substance,
    double amount,
    String unit,
    DateTime timestamp,
    String? memo,
  });
}

/// @nodoc
class __$$ConsumptionRecordEntityImplCopyWithImpl<$Res>
    extends
        _$ConsumptionRecordEntityCopyWithImpl<
          $Res,
          _$ConsumptionRecordEntityImpl
        >
    implements _$$ConsumptionRecordEntityImplCopyWith<$Res> {
  __$$ConsumptionRecordEntityImplCopyWithImpl(
    _$ConsumptionRecordEntityImpl _value,
    $Res Function(_$ConsumptionRecordEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ConsumptionRecordEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? substance = null,
    Object? amount = null,
    Object? unit = null,
    Object? timestamp = null,
    Object? memo = freezed,
  }) {
    return _then(
      _$ConsumptionRecordEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        substance: null == substance
            ? _value.substance
            : substance // ignore: cast_nullable_to_non_nullable
                  as String,
        amount: null == amount
            ? _value.amount
            : amount // ignore: cast_nullable_to_non_nullable
                  as double,
        unit: null == unit
            ? _value.unit
            : unit // ignore: cast_nullable_to_non_nullable
                  as String,
        timestamp: null == timestamp
            ? _value.timestamp
            : timestamp // ignore: cast_nullable_to_non_nullable
                  as DateTime,
        memo: freezed == memo
            ? _value.memo
            : memo // ignore: cast_nullable_to_non_nullable
                  as String?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsumptionRecordEntityImpl implements _ConsumptionRecordEntity {
  const _$ConsumptionRecordEntityImpl({
    required this.id,
    required this.substance,
    required this.amount,
    required this.unit,
    required this.timestamp,
    this.memo,
  });

  factory _$ConsumptionRecordEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsumptionRecordEntityImplFromJson(json);

  @override
  final int id;
  @override
  final String substance;
  // 'water', 'caffeine', 'alcohol', 'nicotine'
  @override
  final double amount;
  @override
  final String unit;
  @override
  final DateTime timestamp;
  @override
  final String? memo;

  @override
  String toString() {
    return 'ConsumptionRecordEntity(id: $id, substance: $substance, amount: $amount, unit: $unit, timestamp: $timestamp, memo: $memo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsumptionRecordEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.substance, substance) ||
                other.substance == substance) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.memo, memo) || other.memo == memo));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, substance, amount, unit, timestamp, memo);

  /// Create a copy of ConsumptionRecordEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsumptionRecordEntityImplCopyWith<_$ConsumptionRecordEntityImpl>
  get copyWith =>
      __$$ConsumptionRecordEntityImplCopyWithImpl<
        _$ConsumptionRecordEntityImpl
      >(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsumptionRecordEntityImplToJson(this);
  }
}

abstract class _ConsumptionRecordEntity implements ConsumptionRecordEntity {
  const factory _ConsumptionRecordEntity({
    required final int id,
    required final String substance,
    required final double amount,
    required final String unit,
    required final DateTime timestamp,
    final String? memo,
  }) = _$ConsumptionRecordEntityImpl;

  factory _ConsumptionRecordEntity.fromJson(Map<String, dynamic> json) =
      _$ConsumptionRecordEntityImpl.fromJson;

  @override
  int get id;
  @override
  String get substance; // 'water', 'caffeine', 'alcohol', 'nicotine'
  @override
  double get amount;
  @override
  String get unit;
  @override
  DateTime get timestamp;
  @override
  String? get memo;

  /// Create a copy of ConsumptionRecordEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsumptionRecordEntityImplCopyWith<_$ConsumptionRecordEntityImpl>
  get copyWith => throw _privateConstructorUsedError;
}
