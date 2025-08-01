// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserSettingsEntityImpl _$$UserSettingsEntityImplFromJson(
  Map<String, dynamic> json,
) => _$UserSettingsEntityImpl(
  id: (json['id'] as num).toInt(),
  darkMode: json['darkMode'] as bool,
  language: json['language'] as String,
  notifications: json['notifications'] as bool,
  notificationSettings: Map<String, bool>.from(
    json['notificationSettings'] as Map,
  ),
);

Map<String, dynamic> _$$UserSettingsEntityImplToJson(
  _$UserSettingsEntityImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'darkMode': instance.darkMode,
  'language': instance.language,
  'notifications': instance.notifications,
  'notificationSettings': instance.notificationSettings,
};
