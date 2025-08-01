/// 앱의 기본 상수들을 정의합니다.
class AppConstants {
  // 앱 정보
  static const String appName = 'HydroTracker';
  static const String appVersion = '1.0.0';

  // 추적 대상 물질
  static const String water = 'water';
  static const String caffeine = 'caffeine';
  static const String alcohol = 'alcohol';
  static const String nicotine = 'nicotine';

  // 기본 단위
  static const String liter = 'L';
  static const String milliliter = 'ml';
  static const String milligram = 'mg';
  static const String drink = '잔';
  static const String cigarette = '개비';

  // 기본 목표량
  static const double defaultWaterGoal = 2.0; // 리터
  static const double defaultCaffeineGoal = 400.0; // 밀리그램
  static const double defaultAlcoholGoal = 2.0; // 잔
  static const double defaultNicotineGoal = 0.0; // 개비

  // 알림 설정
  static const int waterReminderInterval = 2; // 시간
  static const String reminderChannelId = 'hydro_tracker_reminders';
  static const String reminderChannelName = 'HydroTracker 알림';
  static const String reminderChannelDescription = '수분 섭취 알림';

  // 데이터베이스
  static const String databaseName = 'hydro_tracker.db';
  static const int databaseVersion = 1;

  // 테마
  static const String lightTheme = 'light';
  static const String darkTheme = 'dark';
  static const String systemTheme = 'system';

  // 색상 (Material Design 3)
  static const int primaryColor = 0xFF2196F3; // 파란색 - 수분
  static const int secondaryColor = 0xFFFF9800; // 주황색 - 카페인
  static const int warningColor = 0xFFF44336; // 빨간색 - 알코올
  static const int dangerColor = 0xFF9C27B0; // 보라색 - 니코틴
}
