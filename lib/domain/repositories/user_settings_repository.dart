import '../../core/result/result.dart';
import '../entities/user_settings_entity.dart';

/// 사용자 설정 Repository 인터페이스
///
/// 사용자 설정의 CRUD 작업을 담당합니다.
abstract interface class UserSettingsRepository {
  /// 사용자 설정을 조회합니다.
  Future<Result<UserSettingsEntity?, Exception>> getUserSettings();

  /// 사용자 설정을 저장합니다.
  Future<Result<void, Exception>> saveUserSettings(UserSettingsEntity settings);

  /// 다크모드 설정을 업데이트합니다.
  Future<Result<void, Exception>> updateDarkMode(bool isDarkMode);

  /// 알림 설정을 업데이트합니다.
  Future<Result<void, Exception>> updateNotifications(bool isEnabled);

  /// 특정 알림 설정을 업데이트합니다.
  Future<Result<void, Exception>> updateNotificationSetting(
    String notificationType,
    bool isEnabled,
  );

  /// 모든 알림 설정을 조회합니다.
  Future<Result<Map<String, bool>, Exception>> getNotificationSettings();

  /// 기본 설정을 초기화합니다.
  Future<Result<void, Exception>> initializeDefaultSettings();

  /// 설정을 초기화합니다.
  Future<Result<void, Exception>> resetSettings();
}
