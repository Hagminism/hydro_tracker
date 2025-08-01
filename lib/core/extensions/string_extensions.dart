/// String 클래스의 확장 메서드들을 제공합니다.
extension StringExtensions on String {
  /// 문자열이 비어있거나 공백만 있는지 확인합니다.
  bool get isBlank => trim().isEmpty;

  /// 문자열이 비어있지 않은지 확인합니다.
  bool get isNotBlank => !isBlank;

  /// 첫 글자를 대문자로 변환합니다.
  String get capitalize {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1)}';
  }

  /// 각 단어의 첫 글자를 대문자로 변환합니다.
  String get titleCase {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize).join(' ');
  }

  /// 문자열을 camelCase로 변환합니다.
  String get toCamelCase {
    if (isEmpty) return this;
    final words = split(RegExp(r'[\s_-]+'));
    if (words.length == 1) return words[0].toLowerCase();

    return words[0].toLowerCase() +
        words.skip(1).map((word) => word.capitalize).join();
  }

  /// 문자열을 snake_case로 변환합니다.
  String get toSnakeCase {
    return replaceAllMapped(
      RegExp(r'[A-Z]'),
      (match) => '_${match.group(0)!.toLowerCase()}',
    ).toLowerCase().replaceAll(RegExp(r'[\s_-]+'), '_');
  }

  /// 문자열을 kebab-case로 변환합니다.
  String get toKebabCase {
    return toSnakeCase.replaceAll('_', '-');
  }

  /// 문자열을 PascalCase로 변환합니다.
  String get toPascalCase {
    if (isEmpty) return this;
    return split(RegExp(r'[\s_-]+')).map((word) => word.capitalize).join();
  }

  /// 문자열에서 숫자만 추출합니다.
  String get extractNumbers {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// 문자열에서 특수문자를 제거합니다.
  String get removeSpecialCharacters {
    return replaceAll(RegExp(r'[^a-zA-Z0-9가-힣\s]'), '');
  }

  /// 문자열을 지정된 길이로 자르고 말줄임표를 추가합니다.
  String truncate(int maxLength, {String suffix = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength - suffix.length)}$suffix';
  }

  /// 문자열이 이메일 형식인지 확인합니다.
  bool get isEmail {
    final emailRegex = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
    return emailRegex.hasMatch(this);
  }

  /// 문자열이 전화번호 형식인지 확인합니다.
  bool get isPhoneNumber {
    final phoneRegex = RegExp(r'^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$');
    return phoneRegex.hasMatch(this);
  }

  /// 문자열이 URL 형식인지 확인합니다.
  bool get isUrl {
    try {
      Uri.parse(this);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// 문자열을 숫자로 변환합니다 (실패 시 null 반환).
  int? get toIntOrNull {
    try {
      return int.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// 문자열을 실수로 변환합니다 (실패 시 null 반환).
  double? get toDoubleOrNull {
    try {
      return double.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// 문자열을 날짜로 변환합니다 (실패 시 null 반환).
  DateTime? get toDateTimeOrNull {
    try {
      return DateTime.parse(this);
    } catch (e) {
      return null;
    }
  }

  /// 문자열이 숫자인지 확인합니다.
  bool get isNumeric {
    return toDoubleOrNull != null;
  }

  /// 문자열이 정수인지 확인합니다.
  bool get isInteger {
    return toIntOrNull != null;
  }

  /// 문자열을 반전시킵니다.
  String get reversed {
    return split('').reversed.join();
  }

  /// 문자열에서 중복된 공백을 제거합니다.
  String get normalizeWhitespace {
    return replaceAll(RegExp(r'\s+'), ' ').trim();
  }

  /// 문자열을 지정된 구분자로 분할합니다.
  List<String> splitBy(String delimiter) {
    return split(delimiter);
  }

  /// 문자열이 지정된 접두사로 시작하는지 확인합니다.
  bool startsWithAny(List<String> prefixes) {
    return prefixes.any((prefix) => startsWith(prefix));
  }

  /// 문자열이 지정된 접미사로 끝나는지 확인합니다.
  bool endsWithAny(List<String> suffixes) {
    return suffixes.any((suffix) => endsWith(suffix));
  }
}
