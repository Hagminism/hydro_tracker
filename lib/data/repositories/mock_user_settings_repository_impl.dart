import '../../core/result/result.dart';
import '../../domain/entities/user_settings_entity.dart';
import '../../domain/repositories/user_settings_repository.dart';

/// Mock UserSettingsRepository 구현체
///
/// 테스트 및 개발 단계에서 사용할 Mock 데이터를 제공합니다.
class MockUserSettingsRepositoryImpl implements UserSettingsRepository {
  UserSettingsEntity? _mockSettings;

  /// 기본 설정으로 초기화
  MockUserSettingsRepositoryImpl() {
    _initializeDefaultSettings();
  }

  void _initializeDefaultSettings() {
    _mockSettings = const UserSettingsEntity(
      id: 1,
      darkMode: false,
      language: 'ko',
      notifications: true,
      notificationSettings: {
        'water_reminder': true,
        'goal_achievement': true,
        'goal_missed': true,
        'overconsumption_warning': true,
        'daily_summary': false,
      },
    );
  }

  @override
  Future<Result<UserSettingsEntity?, Exception>> getUserSettings() async {
    try {
      await Future.delayed(const Duration(milliseconds: 80));
      return Result.success(_mockSettings);
    } catch (e) {
      return Result.failure(Exception('설정 조회 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> saveUserSettings(
    UserSettingsEntity settings,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      _mockSettings = settings;
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception('설정 저장 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> updateDarkMode(bool isDarkMode) async {
    try {
      await Future.delayed(const Duration(milliseconds: 60));
      if (_mockSettings != null) {
        _mockSettings = UserSettingsEntity(
          id: _mockSettings!.id,
          darkMode: isDarkMode,
          language: _mockSettings!.language,
          notifications: _mockSettings!.notifications,
          notificationSettings: _mockSettings!.notificationSettings,
        );
        return Result.success(null);
      } else {
        return Result.failure(Exception('설정이 초기화되지 않았습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('다크모드 설정 업데이트 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> updateNotifications(bool isEnabled) async {
    try {
      await Future.delayed(const Duration(milliseconds: 70));
      if (_mockSettings != null) {
        _mockSettings = UserSettingsEntity(
          id: _mockSettings!.id,
          darkMode: _mockSettings!.darkMode,
          language: _mockSettings!.language,
          notifications: isEnabled,
          notificationSettings: _mockSettings!.notificationSettings,
        );
        return Result.success(null);
      } else {
        return Result.failure(Exception('설정이 초기화되지 않았습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('알림 설정 업데이트 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> updateNotificationSetting(
    String notificationType,
    bool isEnabled,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      if (_mockSettings != null) {
        final updatedSettings = Map<String, bool>.from(
          _mockSettings!.notificationSettings,
        );
        updatedSettings[notificationType] = isEnabled;

        _mockSettings = UserSettingsEntity(
          id: _mockSettings!.id,
          darkMode: _mockSettings!.darkMode,
          language: _mockSettings!.language,
          notifications: _mockSettings!.notifications,
          notificationSettings: updatedSettings,
        );
        return Result.success(null);
      } else {
        return Result.failure(Exception('설정이 초기화되지 않았습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('특정 알림 설정 업데이트 실패: $e'));
    }
  }

  @override
  Future<Result<Map<String, bool>, Exception>> getNotificationSettings() async {
    try {
      await Future.delayed(const Duration(milliseconds: 40));
      if (_mockSettings != null) {
        return Result.success(_mockSettings!.notificationSettings);
      } else {
        return Result.failure(Exception('설정이 초기화되지 않았습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('알림 설정 조회 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> initializeDefaultSettings() async {
    try {
      await Future.delayed(const Duration(milliseconds: 90));
      _initializeDefaultSettings();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception('기본 설정 초기화 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> resetSettings() async {
    try {
      await Future.delayed(const Duration(milliseconds: 80));
      _mockSettings = null;
      _initializeDefaultSettings();
      return Result.success(null);
    } catch (e) {
      return Result.failure(Exception('설정 초기화 실패: $e'));
    }
  }
}
