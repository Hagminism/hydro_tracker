/// DateTime 클래스의 확장 메서드들을 제공합니다.
extension DateTimeExtensions on DateTime {
  /// 날짜가 오늘인지 확인합니다.
  bool get isToday {
    final now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  /// 날짜가 어제인지 확인합니다.
  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  /// 날짜가 이번 주에 속하는지 확인합니다.
  bool get isThisWeek {
    final now = DateTime.now();
    final weekStart = now.subtract(Duration(days: now.weekday - 1));
    final weekEnd = weekStart.add(const Duration(days: 6));

    return isAfter(weekStart.subtract(const Duration(days: 1))) &&
        isBefore(weekEnd.add(const Duration(days: 1)));
  }

  /// 날짜가 이번 달에 속하는지 확인합니다.
  bool get isThisMonth {
    final now = DateTime.now();
    return year == now.year && month == now.month;
  }

  /// 날짜가 이번 년도에 속하는지 확인합니다.
  bool get isThisYear {
    return year == DateTime.now().year;
  }

  /// 날짜가 미래인지 확인합니다.
  bool get isFuture {
    return isAfter(DateTime.now());
  }

  /// 날짜가 과거인지 확인합니다.
  bool get isPast {
    return isBefore(DateTime.now());
  }

  /// 날짜가 주말인지 확인합니다.
  bool get isWeekend {
    return weekday == DateTime.saturday || weekday == DateTime.sunday;
  }

  /// 날짜가 평일인지 확인합니다.
  bool get isWeekday {
    return !isWeekend;
  }

  /// 날짜를 포맷된 문자열로 변환합니다.
  String format({String? pattern}) {
    final year = this.year.toString().padLeft(4, '0');
    final month = this.month.toString().padLeft(2, '0');
    final day = this.day.toString().padLeft(2, '0');
    final hour = this.hour.toString().padLeft(2, '0');
    final minute = this.minute.toString().padLeft(2, '0');
    final second = this.second.toString().padLeft(2, '0');

    switch (pattern) {
      case 'yyyy-MM-dd':
        return '$year-$month-$day';
      case 'HH:mm':
        return '$hour:$minute';
      case 'HH:mm:ss':
        return '$hour:$minute:$second';
      case 'yyyy-MM-dd HH:mm':
        return '$year-$month-$day $hour:$minute';
      case 'yyyy-MM-dd HH:mm:ss':
        return '$year-$month-$day $hour:$minute:$second';
      default:
        return '$year-$month-$day $hour:$minute';
    }
  }

  /// 상대적 시간 표현을 반환합니다.
  String get relativeTime {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (isToday) {
      return format(pattern: 'HH:mm');
    } else if (isYesterday) {
      return '어제';
    } else if (difference.inDays < 7) {
      return '${difference.inDays}일 전';
    } else if (difference.inDays < 30) {
      final weeks = (difference.inDays / 7).floor();
      return '${weeks}주 전';
    } else if (difference.inDays < 365) {
      final months = (difference.inDays / 30).floor();
      return '${months}개월 전';
    } else {
      final years = (difference.inDays / 365).floor();
      return '${years}년 전';
    }
  }

  /// 요일을 한글로 반환합니다.
  String get koreanWeekday {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    return weekdays[weekday - 1];
  }

  /// 요일을 영어로 반환합니다.
  String get englishWeekday {
    const weekdays = [
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday',
      'Sunday',
    ];
    return weekdays[weekday - 1];
  }

  /// 월을 한글로 반환합니다.
  String get koreanMonth {
    const months = [
      '1월',
      '2월',
      '3월',
      '4월',
      '5월',
      '6월',
      '7월',
      '8월',
      '9월',
      '10월',
      '11월',
      '12월',
    ];
    return months[month - 1];
  }

  /// 월을 영어로 반환합니다.
  String get englishMonth {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }

  /// 날짜를 간단한 형태로 반환합니다.
  String get simpleDate {
    return '$month/$day';
  }

  /// 시간을 간단한 형태로 반환합니다.
  String get simpleTime {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  /// 날짜가 특정 기간 내에 있는지 확인합니다.
  bool isBetween(DateTime start, DateTime end) {
    return isAfter(start.subtract(const Duration(seconds: 1))) &&
        isBefore(end.add(const Duration(seconds: 1)));
  }

  /// 날짜에 일수를 더합니다.
  DateTime addDays(int days) {
    return add(Duration(days: days));
  }

  /// 날짜에 월수를 더합니다.
  DateTime addMonths(int months) {
    return DateTime(year, month + months, day);
  }

  /// 날짜에 년수를 더합니다.
  DateTime addYears(int years) {
    return DateTime(year + years, month, day);
  }

  /// 날짜에서 일수를 뺍니다.
  DateTime subtractDays(int days) {
    return subtract(Duration(days: days));
  }

  /// 날짜에서 월수를 뺍니다.
  DateTime subtractMonths(int months) {
    return DateTime(year, month - months, day);
  }

  /// 날짜에서 년수를 뺍니다.
  DateTime subtractYears(int years) {
    return DateTime(year - years, month, day);
  }

  /// 날짜의 시작 (00:00:00)을 반환합니다.
  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  /// 날짜의 끝 (23:59:59)을 반환합니다.
  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59);
  }

  /// 주의 시작 (월요일 00:00:00)을 반환합니다.
  DateTime get startOfWeek {
    final daysFromMonday = weekday - 1;
    return DateTime(year, month, day - daysFromMonday);
  }

  /// 주의 끝 (일요일 23:59:59)을 반환합니다.
  DateTime get endOfWeek {
    final daysFromSunday = 7 - weekday;
    return DateTime(year, month, day + daysFromSunday, 23, 59, 59);
  }

  /// 월의 시작 (1일 00:00:00)을 반환합니다.
  DateTime get startOfMonth {
    return DateTime(year, month, 1);
  }

  /// 월의 끝 (마지막 날 23:59:59)을 반환합니다.
  DateTime get endOfMonth {
    return DateTime(year, month + 1, 0, 23, 59, 59);
  }

  /// 년의 시작 (1월 1일 00:00:00)을 반환합니다.
  DateTime get startOfYear {
    return DateTime(year, 1, 1);
  }

  /// 년의 끝 (12월 31일 23:59:59)을 반환합니다.
  DateTime get endOfYear {
    return DateTime(year, 12, 31, 23, 59, 59);
  }
}
