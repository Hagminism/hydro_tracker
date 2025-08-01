import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_settings_entity.freezed.dart';
part 'user_settings_entity.g.dart';

/// 사용자 설정 엔티티
///
/// 사용자의 앱 설정을 나타냅니다.
@freezed
class UserSettingsEntity with _$UserSettingsEntity {
  const factory UserSettingsEntity({
    required int id,
    required bool darkMode,
    required String language,
    required bool notifications,
    required Map<String, bool> notificationSettings,
  }) = _UserSettingsEntity;

  factory UserSettingsEntity.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsEntityFromJson(json);
}
