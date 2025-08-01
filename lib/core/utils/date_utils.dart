/// 날짜 관련 유틸리티 함수들을 제공합니다.
class DateUtils {
  /// 오늘 날짜를 반환합니다.
  static DateTime get today => DateTime.now();

  /// 어제 날짜를 반환합니다.
  static DateTime get yesterday => today.subtract(const Duration(days: 1));

  /// 이번 주 시작일을 반환합니다 (월요일).
  static DateTime get weekStart {
    final now = today;
    final daysFromMonday = now.weekday - 1;
    return now.subtract(Duration(days: daysFromMonday));
  }

  /// 이번 주 종료일을 반환합니다 (일요일).
  static DateTime get weekEnd => weekStart.add(const Duration(days: 6));

  /// 이번 달 시작일을 반환합니다.
  static DateTime get monthStart => DateTime(today.year, today.month, 1);

  /// 이번 달 종료일을 반환합니다.
  static DateTime get monthEnd => DateTime(today.year, today.month + 1, 0);

  /// 특정 날짜가 오늘인지 확인합니다.
  static bool isToday(DateTime date) {
    final now = today;
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// 특정 날짜가 어제인지 확인합니다.
  static bool isYesterday(DateTime date) {
    final yesterday = DateUtils.yesterday;
    return date.year == yesterday.year &&
        date.month == yesterday.month &&
        date.day == yesterday.day;
  }

  /// 특정 날짜가 이번 주에 속하는지 확인합니다.
  static bool isThisWeek(DateTime date) {
    return date.isAfter(weekStart.subtract(const Duration(days: 1))) &&
        date.isBefore(weekEnd.add(const Duration(days: 1)));
  }

  /// 특정 날짜가 이번 달에 속하는지 확인합니다.
  static bool isThisMonth(DateTime date) {
    return date.year == today.year && date.month == today.month;
  }

  /// 날짜를 포맷된 문자열로 변환합니다.
  static String formatDate(DateTime date, {String? pattern}) {
    final year = date.year.toString().padLeft(4, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  /// 시간을 포맷된 문자열로 변환합니다.
  static String formatTime(DateTime time, {String? pattern}) {
    final hour = time.hour.toString().padLeft(2, '0');
    final minute = time.minute.toString().padLeft(2, '0');
    return '$hour:$minute';
  }

  /// 날짜와 시간을 포맷된 문자열로 변환합니다.
  static String formatDateTime(DateTime dateTime, {String? pattern}) {
    return '${formatDate(dateTime)} ${formatTime(dateTime)}';
  }

  /// 상대적 시간 표현을 반환합니다 (예: "2시간 전", "어제").
  static String getRelativeTime(DateTime dateTime) {
    final now = today;
    final difference = now.difference(dateTime);

    if (isToday(dateTime)) {
      return formatTime(dateTime);
    } else if (isYesterday(dateTime)) {
      return '어제';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}일 전';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}주 전';
    } else {
      return formatDate(dateTime);
    }
  }

  /// 두 날짜 사이의 일수를 계산합니다.
  static int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  /// 주어진 날짜의 요일을 한글로 반환합니다.
  static String getKoreanWeekday(DateTime date) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekdays[date.weekday - 1];
  }
}
