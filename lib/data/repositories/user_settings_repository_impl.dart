import 'dart:convert';
import 'package:sqflite/sqflite.dart';
import '../../core/exceptions/database_exception.dart' as hydro_exceptions;
import '../../domain/entities/user_settings_entity.dart';
import '../../domain/repositories/user_settings_repository_interface.dart';
import '../datasources/local/database_helper.dart';

/// UserSettingsRepository의 실제 구현체
/// sqflite를 사용하여 로컬 SQLite 데이터베이스와 상호작용합니다.
class UserSettingsRepositoryImpl implements UserSettingsRepositoryInterface {
  const UserSettingsRepositoryImpl();

  @override
  Future<UserSettingsEntity?> getUserSettings() async {
    try {
      final db = await DatabaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query(
        'user_settings',
        limit: 1,
      );

      if (maps.isEmpty) {
        return null;
      }

      return _mapToEntity(maps.first);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 조회 실패', e.toString());
    }
  }

  @override
  Future<UserSettingsEntity> createUserSettings(UserSettingsEntity settings) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(settings);
      
      // id 필드 제거 (자동 생성)
      map.remove('id');

      final id = await db.insert('user_settings', map);
      return settings.copyWith(id: id);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 생성 실패', e.toString());
    }
  }

  @override
  Future<void> updateUserSettings(UserSettingsEntity settings) async {
    try {
      final db = await DatabaseHelper.database;
      final map = _entityToMap(settings);
      
      // updated_at 필드 업데이트
      map['updated_at'] = DateTime.now().toIso8601String();

      final count = await db.update(
        'user_settings',
        map,
        where: 'id = ?',
        whereArgs: [settings.id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('업데이트할 설정을 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 수정 실패', e.toString());
    }
  }

  @override
  Future<void> deleteUserSettings(int id) async {
    try {
      final db = await DatabaseHelper.database;
      final count = await db.delete(
        'user_settings',
        where: 'id = ?',
        whereArgs: [id],
      );

      if (count == 0) {
        throw hydro_exceptions.HydroTrackerDatabaseException('삭제할 설정을 찾을 수 없습니다');
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 삭제 실패', e.toString());
    }
  }

  @override
  Future<UserSettingsEntity> getOrCreateUserSettings() async {
    try {
      final settings = await getUserSettings();
      if (settings != null) {
        return settings;
      }

      // 기본 설정 생성
      final defaultSettings = UserSettingsEntity(
        id: 0,
        darkMode: false,
        language: 'ko',
        notifications: true,
        notificationSettings: {
          'water_reminder': true,
          'goal_achievement': true,
          'goal_missed': true,
          'overconsumption_warning': true,
        },
      );

      return await createUserSettings(defaultSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 조회/생성 실패', e.toString());
    }
  }

  @override
  Future<void> updateDarkMode(bool darkMode) async {
    try {
      final settings = await getOrCreateUserSettings();
      final updatedSettings = settings.copyWith(darkMode: darkMode);
      await updateUserSettings(updatedSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('다크모드 설정 실패', e.toString());
    }
  }

  @override
  Future<void> updateLanguage(String language) async {
    try {
      final settings = await getOrCreateUserSettings();
      final updatedSettings = settings.copyWith(language: language);
      await updateUserSettings(updatedSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('언어 설정 실패', e.toString());
    }
  }

  @override
  Future<void> updateNotifications(bool notifications) async {
    try {
      final settings = await getOrCreateUserSettings();
      final updatedSettings = settings.copyWith(notifications: notifications);
      await updateUserSettings(updatedSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('알림 설정 실패', e.toString());
    }
  }

  @override
  Future<void> updateNotificationSettings(Map<String, bool> notificationSettings) async {
    try {
      final settings = await getOrCreateUserSettings();
      final updatedSettings = settings.copyWith(notificationSettings: notificationSettings);
      await updateUserSettings(updatedSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('알림 세부 설정 실패', e.toString());
    }
  }

  @override
  Future<bool> getDarkMode() async {
    try {
      final settings = await getOrCreateUserSettings();
      return settings.darkMode;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('다크모드 조회 실패', e.toString());
    }
  }

  @override
  Future<String> getLanguage() async {
    try {
      final settings = await getOrCreateUserSettings();
      return settings.language;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('언어 조회 실패', e.toString());
    }
  }

  @override
  Future<bool> getNotifications() async {
    try {
      final settings = await getOrCreateUserSettings();
      return settings.notifications;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('알림 설정 조회 실패', e.toString());
    }
  }

  @override
  Future<Map<String, bool>> getNotificationSettings() async {
    try {
      final settings = await getOrCreateUserSettings();
      return settings.notificationSettings;
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('알림 세부 설정 조회 실패', e.toString());
    }
  }

  @override
  Future<void> saveUserSettings(UserSettingsEntity settings) async {
    try {
      if (settings.id == 0) {
        await createUserSettings(settings);
      } else {
        await updateUserSettings(settings);
      }
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('사용자 설정 저장 실패', e.toString());
    }
  }

  @override
  Future<void> updateNotificationSetting(String key, bool value) async {
    try {
      final settings = await getOrCreateUserSettings();
      final updatedNotificationSettings = Map<String, bool>.from(settings.notificationSettings);
      updatedNotificationSettings[key] = value;
      
      final updatedSettings = settings.copyWith(notificationSettings: updatedNotificationSettings);
      await updateUserSettings(updatedSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('알림 설정 업데이트 실패', e.toString());
    }
  }

  @override
  Future<void> initializeDefaultSettings() async {
    try {
      final existingSettings = await getUserSettings();
      if (existingSettings != null) {
        return; // 이미 설정이 있으면 초기화하지 않음
      }

      final defaultSettings = UserSettingsEntity(
        id: 0,
        darkMode: false,
        language: 'ko',
        notifications: true,
        notificationSettings: {
          'water_reminder': true,
          'goal_achievement': true,
          'goal_missed': true,
          'overconsumption_warning': true,
        },
      );

      await createUserSettings(defaultSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('기본 설정 초기화 실패', e.toString());
    }
  }

  @override
  Future<void> resetSettings() async {
    try {
      final db = await DatabaseHelper.database;
      await db.delete('user_settings');
      await initializeDefaultSettings();
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('설정 초기화 실패', e.toString());
    }
  }

  @override
  Future<Map<String, dynamic>> backupSettings() async {
    try {
      final settings = await getOrCreateUserSettings();
      return {
        'darkMode': settings.darkMode,
        'language': settings.language,
        'notifications': settings.notifications,
        'notificationSettings': settings.notificationSettings,
        'backupDate': DateTime.now().toIso8601String(),
      };
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('설정 백업 실패', e.toString());
    }
  }

  @override
  Future<void> restoreSettings(Map<String, dynamic> backup) async {
    try {
      final settings = await getOrCreateUserSettings();
      final restoredSettings = settings.copyWith(
        darkMode: backup['darkMode'] as bool? ?? false,
        language: backup['language'] as String? ?? 'ko',
        notifications: backup['notifications'] as bool? ?? true,
        notificationSettings: (backup['notificationSettings'] as Map<String, dynamic>?)?.map(
          (key, value) => MapEntry(key, value as bool),
        ) ?? {
          'water_reminder': true,
          'goal_achievement': true,
          'goal_missed': true,
          'overconsumption_warning': true,
        },
      );

      await updateUserSettings(restoredSettings);
    } catch (e) {
      throw hydro_exceptions.HydroTrackerDatabaseException('설정 복원 실패', e.toString());
    }
  }

  /// Map을 UserSettingsEntity로 변환합니다.
  UserSettingsEntity _mapToEntity(Map<String, dynamic> map) {
    Map<String, bool> notificationSettings = {};
    
    if (map['notification_settings'] != null) {
      try {
        final jsonMap = jsonDecode(map['notification_settings'] as String) as Map<String, dynamic>;
        notificationSettings = jsonMap.map((key, value) => MapEntry(key, value as bool));
      } catch (e) {
        // JSON 파싱 실패 시 기본값 사용
        notificationSettings = {
          'water_reminder': true,
          'goal_achievement': true,
          'goal_missed': true,
          'overconsumption_warning': true,
        };
      }
    }

    return UserSettingsEntity(
      id: map['id'] as int,
      darkMode: (map['dark_mode'] as int) == 1,
      language: map['language'] as String,
      notifications: (map['notifications'] as int) == 1,
      notificationSettings: notificationSettings,
    );
  }

  /// UserSettingsEntity를 Map으로 변환합니다.
  Map<String, dynamic> _entityToMap(UserSettingsEntity entity) {
    return {
      'id': entity.id,
      'dark_mode': entity.darkMode ? 1 : 0,
      'language': entity.language,
      'notifications': entity.notifications ? 1 : 0,
      'notification_settings': jsonEncode(entity.notificationSettings),
    };
  }
} 