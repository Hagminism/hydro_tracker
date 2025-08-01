import '../entities/user_settings_entity.dart';

/// 사용자 설정 repository 인터페이스
abstract interface class UserSettingsRepositoryInterface {
  /// 사용자 설정을 가져옵니다.
  Future<UserSettingsEntity?> getUserSettings();

  /// 사용자 설정을 저장합니다.
  Future<void> saveUserSettings(UserSettingsEntity settings);

  /// 다크모드 설정을 업데이트합니다.
  Future<void> updateDarkMode(bool darkMode);

  /// 언어 설정을 업데이트합니다.
  Future<void> updateLanguage(String language);

  /// 알림 설정을 업데이트합니다.
  Future<void> updateNotifications(bool notifications);

  /// 특정 알림 설정을 업데이트합니다.
  Future<void> updateNotificationSetting(String key, bool value);

  /// 기본 설정을 초기화합니다.
  Future<void> initializeDefaultSettings();

  /// 설정을 초기화합니다.
  Future<void> resetSettings();

  /// 설정을 백업합니다.
  Future<Map<String, dynamic>> backupSettings();

  /// 설정을 복원합니다.
  Future<void> restoreSettings(Map<String, dynamic> backup);
}
