/// API 관련 상수들을 정의합니다.
class ApiConstants {
  // API 엔드포인트 (향후 확장을 위해)
  static const String baseUrl = 'https://api.hydrotracker.com';
  static const String version = 'v1';

  // HTTP 상태 코드
  static const int ok = 200;
  static const int created = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // 요청 헤더
  static const String contentType = 'Content-Type';
  static const String applicationJson = 'application/json';
  static const String authorization = 'Authorization';
  static const String bearer = 'Bearer';

  // 응답 키
  static const String success = 'success';
  static const String message = 'message';
  static const String data = 'data';
  static const String error = 'error';

  // 타임아웃 설정
  static const Duration connectionTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // 재시도 설정
  static const int maxRetries = 3;
  static const Duration retryDelay = Duration(seconds: 2);
}
