/// 데이터 검증 관련 유틸리티 함수들을 제공합니다.
class ValidationUtils {
  /// 문자열이 비어있지 않은지 확인합니다.
  static bool isNotEmpty(String? value) {
    return value != null && value.trim().isNotEmpty;
  }

  /// 문자열이 최소 길이를 만족하는지 확인합니다.
  static bool hasMinLength(String value, int minLength) {
    return value.trim().length >= minLength;
  }

  /// 문자열이 최대 길이를 초과하지 않는지 확인합니다.
  static bool hasMaxLength(String value, int maxLength) {
    return value.trim().length <= maxLength;
  }

  /// 문자열이 특정 길이인지 확인합니다.
  static bool hasExactLength(String value, int length) {
    return value.trim().length == length;
  }

  /// 이메일 형식이 올바른지 확인합니다.
  static bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(email);
  }

  /// 전화번호 형식이 올바른지 확인합니다.
  static bool isValidPhoneNumber(String phone) {
    final phoneRegex = RegExp(r'^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$');
    return phoneRegex.hasMatch(phone);
  }

  /// 숫자가 양수인지 확인합니다.
  static bool isPositiveNumber(num value) {
    return value > 0;
  }

  /// 숫자가 0 이상인지 확인합니다.
  static bool isNonNegativeNumber(num value) {
    return value >= 0;
  }

  /// 숫자가 특정 범위 내에 있는지 확인합니다.
  static bool isInRange(num value, num min, num max) {
    return value >= min && value <= max;
  }

  /// 날짜가 유효한지 확인합니다.
  static bool isValidDate(DateTime date) {
    try {
      DateTime(date.year, date.month, date.day);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 날짜가 미래인지 확인합니다.
  static bool isFutureDate(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  /// 날짜가 과거인지 확인합니다.
  static bool isPastDate(DateTime date) {
    return date.isBefore(DateTime.now());
  }

  /// 비밀번호가 안전한지 확인합니다.
  static bool isSecurePassword(String password) {
    // 최소 8자, 영문/숫자/특수문자 포함
    final passwordRegex = RegExp(
      r'^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*(),.?":{}|<>])[a-zA-Z0-9!@#$%^&*(),.?":{}|<>]{8,}$',
    );
    return passwordRegex.hasMatch(password);
  }

  /// URL 형식이 올바른지 확인합니다.
  static bool isValidUrl(String url) {
    try {
      Uri.parse(url);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 한국어 이름 형식이 올바른지 확인합니다.
  static bool isValidKoreanName(String name) {
    final nameRegex = RegExp(r'^[가-힣]{2,4}$');
    return nameRegex.hasMatch(name);
  }

  /// 섭취량이 유효한지 확인합니다.
  static bool isValidConsumptionAmount(double amount) {
    return amount > 0 && amount <= 10000; // 최대 10L
  }

  /// 목표량이 유효한지 확인합니다.
  static bool isValidGoalAmount(double amount) {
    return amount >= 0 && amount <= 10000; // 최대 10L
  }

  /// 메모 길이가 적절한지 확인합니다.
  static bool isValidMemoLength(String memo) {
    return memo.length <= 200; // 최대 200자
  }
}
