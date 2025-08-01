// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserSettingsEntity _$UserSettingsEntityFromJson(Map<String, dynamic> json) {
  return _UserSettingsEntity.fromJson(json);
}

/// @nodoc
mixin _$UserSettingsEntity {
  int get id => throw _privateConstructorUsedError;
  bool get darkMode => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  bool get notifications => throw _privateConstructorUsedError;
  Map<String, bool> get notificationSettings =>
      throw _privateConstructorUsedError;

  /// Serializes this UserSettingsEntity to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserSettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserSettingsEntityCopyWith<UserSettingsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserSettingsEntityCopyWith<$Res> {
  factory $UserSettingsEntityCopyWith(
    UserSettingsEntity value,
    $Res Function(UserSettingsEntity) then,
  ) = _$UserSettingsEntityCopyWithImpl<$Res, UserSettingsEntity>;
  @useResult
  $Res call({
    int id,
    bool darkMode,
    String language,
    bool notifications,
    Map<String, bool> notificationSettings,
  });
}

/// @nodoc
class _$UserSettingsEntityCopyWithImpl<$Res, $Val extends UserSettingsEntity>
    implements $UserSettingsEntityCopyWith<$Res> {
  _$UserSettingsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserSettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? darkMode = null,
    Object? language = null,
    Object? notifications = null,
    Object? notificationSettings = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as int,
            darkMode: null == darkMode
                ? _value.darkMode
                : darkMode // ignore: cast_nullable_to_non_nullable
                      as bool,
            language: null == language
                ? _value.language
                : language // ignore: cast_nullable_to_non_nullable
                      as String,
            notifications: null == notifications
                ? _value.notifications
                : notifications // ignore: cast_nullable_to_non_nullable
                      as bool,
            notificationSettings: null == notificationSettings
                ? _value.notificationSettings
                : notificationSettings // ignore: cast_nullable_to_non_nullable
                      as Map<String, bool>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$UserSettingsEntityImplCopyWith<$Res>
    implements $UserSettingsEntityCopyWith<$Res> {
  factory _$$UserSettingsEntityImplCopyWith(
    _$UserSettingsEntityImpl value,
    $Res Function(_$UserSettingsEntityImpl) then,
  ) = __$$UserSettingsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    int id,
    bool darkMode,
    String language,
    bool notifications,
    Map<String, bool> notificationSettings,
  });
}

/// @nodoc
class __$$UserSettingsEntityImplCopyWithImpl<$Res>
    extends _$UserSettingsEntityCopyWithImpl<$Res, _$UserSettingsEntityImpl>
    implements _$$UserSettingsEntityImplCopyWith<$Res> {
  __$$UserSettingsEntityImplCopyWithImpl(
    _$UserSettingsEntityImpl _value,
    $Res Function(_$UserSettingsEntityImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of UserSettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? darkMode = null,
    Object? language = null,
    Object? notifications = null,
    Object? notificationSettings = null,
  }) {
    return _then(
      _$UserSettingsEntityImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as int,
        darkMode: null == darkMode
            ? _value.darkMode
            : darkMode // ignore: cast_nullable_to_non_nullable
                  as bool,
        language: null == language
            ? _value.language
            : language // ignore: cast_nullable_to_non_nullable
                  as String,
        notifications: null == notifications
            ? _value.notifications
            : notifications // ignore: cast_nullable_to_non_nullable
                  as bool,
        notificationSettings: null == notificationSettings
            ? _value._notificationSettings
            : notificationSettings // ignore: cast_nullable_to_non_nullable
                  as Map<String, bool>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserSettingsEntityImpl implements _UserSettingsEntity {
  const _$UserSettingsEntityImpl({
    required this.id,
    required this.darkMode,
    required this.language,
    required this.notifications,
    required final Map<String, bool> notificationSettings,
  }) : _notificationSettings = notificationSettings;

  factory _$UserSettingsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserSettingsEntityImplFromJson(json);

  @override
  final int id;
  @override
  final bool darkMode;
  @override
  final String language;
  @override
  final bool notifications;
  final Map<String, bool> _notificationSettings;
  @override
  Map<String, bool> get notificationSettings {
    if (_notificationSettings is EqualUnmodifiableMapView)
      return _notificationSettings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_notificationSettings);
  }

  @override
  String toString() {
    return 'UserSettingsEntity(id: $id, darkMode: $darkMode, language: $language, notifications: $notifications, notificationSettings: $notificationSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserSettingsEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.darkMode, darkMode) ||
                other.darkMode == darkMode) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.notifications, notifications) ||
                other.notifications == notifications) &&
            const DeepCollectionEquality().equals(
              other._notificationSettings,
              _notificationSettings,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    id,
    darkMode,
    language,
    notifications,
    const DeepCollectionEquality().hash(_notificationSettings),
  );

  /// Create a copy of UserSettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserSettingsEntityImplCopyWith<_$UserSettingsEntityImpl> get copyWith =>
      __$$UserSettingsEntityImplCopyWithImpl<_$UserSettingsEntityImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$UserSettingsEntityImplToJson(this);
  }
}

abstract class _UserSettingsEntity implements UserSettingsEntity {
  const factory _UserSettingsEntity({
    required final int id,
    required final bool darkMode,
    required final String language,
    required final bool notifications,
    required final Map<String, bool> notificationSettings,
  }) = _$UserSettingsEntityImpl;

  factory _UserSettingsEntity.fromJson(Map<String, dynamic> json) =
      _$UserSettingsEntityImpl.fromJson;

  @override
  int get id;
  @override
  bool get darkMode;
  @override
  String get language;
  @override
  bool get notifications;
  @override
  Map<String, bool> get notificationSettings;

  /// Create a copy of UserSettingsEntity
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserSettingsEntityImplCopyWith<_$UserSettingsEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
