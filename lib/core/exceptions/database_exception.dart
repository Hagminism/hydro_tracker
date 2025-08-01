/// 데이터베이스 관련 예외 클래스
class HydroTrackerDatabaseException implements Exception {
  final String message;
  final String? details;

  const HydroTrackerDatabaseException(this.message, [this.details]);

  @override
  String toString() {
    if (details != null) {
      return 'HydroTrackerDatabaseException: $message - $details';
    }
    return 'HydroTrackerDatabaseException: $message';
  }
} 