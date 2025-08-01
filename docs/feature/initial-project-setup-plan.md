# 1번 이슈: 프로젝트 초기 설정 - 작업 계획

## 브랜치 정보
- **브랜치명**: `feature/initial-project-setup`
- **이슈 번호**: #1
- **작업자**: 이학민님

## 작업 개요
HydroTracker Flutter 앱의 기본 프로젝트 구조를 설정하고 개발 환경을 구성합니다.

## 세부 작업 항목

### 1.1 Flutter 프로젝트 생성
- [x] Flutter 3.x 프로젝트 생성 (`flutter create hydrotracker`)
- [x] 프로젝트 이름 및 패키지명 설정
- [x] 기본 앱 구조 확인

### 1.2 Git 저장소 초기화
- [x] Git 저장소 초기화 (이미 완료됨)
- [x] .gitignore 파일 설정
- [x] 초기 커밋 생성

### 1.3 기본 폴더 구조 설정 (Clean Architecture)
- [x] Clean Architecture 폴더 구조 생성
- [x] 기본 파일들 생성 (빈 파일로 시작)
- [x] 폴더 구조 검증

```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── theme.dart
├── core/
│   ├── constants/
│   │   ├── app_constants.dart
│   │   └── api_constants.dart
│   ├── utils/
│   │   ├── date_utils.dart
│   │   └── validation_utils.dart
│   └── extensions/
│       ├── string_extensions.dart
│       └── date_extensions.dart
├── data/
│   ├── models/
│   │   ├── consumption_record.dart
│   │   ├── goal.dart
│   │   └── user_settings.dart
│   ├── repositories/
│   │   ├── consumption_repository.dart
│   │   ├── goal_repository.dart
│   │   └── user_settings_repository.dart
│   └── datasources/
│       ├── local/
│       │   └── database_helper.dart
│       └── remote/
├── domain/
│   ├── entities/
│   │   ├── consumption_record_entity.dart
│   │   ├── goal_entity.dart
│   │   └── user_settings_entity.dart
│   ├── repositories/
│   │   ├── consumption_repository_interface.dart
│   │   ├── goal_repository_interface.dart
│   │   └── user_settings_repository_interface.dart
│   └── usecases/
│       ├── consumption_usecases.dart
│       ├── goal_usecases.dart
│       └── user_settings_usecases.dart
├── presentation/
│   ├── pages/
│   │   ├── home_page.dart
│   │   ├── add_consumption_page.dart
│   │   ├── statistics_page.dart
│   │   └── settings_page.dart
│   ├── widgets/
│   │   ├── common/
│   │   │   ├── custom_button.dart
│   │   │   ├── custom_text_field.dart
│   │   │   └── loading_widget.dart
│   │   ├── charts/
│   │   │   ├── progress_chart.dart
│   │   │   ├── bar_chart.dart
│   │   │   └── line_chart.dart
│   │   └── cards/
│   │       ├── goal_card.dart
│   │       └── consumption_card.dart
│   └── providers/
│       ├── consumption_provider.dart
│       ├── goal_provider.dart
│       └── user_settings_provider.dart
└── shared/
    ├── widgets/
    │   ├── app_bar_widget.dart
    │   └── bottom_navigation_widget.dart
    └── services/
        ├── notification_service.dart
        └── storage_service.dart
```

### 1.4 pubspec.yaml 의존성 설정
필요한 패키지들을 추가합니다:

#### 핵심 패키지
- [x] `flutter_riverpod` - 상태 관리
- [x] `sqflite` - SQLite 데이터베이스
- [x] `fl_chart` - 차트 라이브러리
- [x] `freezed_annotation` - 불변 객체 생성
- [x] `json_annotation` - JSON 직렬화
- [x] `get_it` - 의존성 주입
- [x] `go_router` - 라우팅

#### UI/UX 패키지
- [x] `flutter_svg` - SVG 아이콘 지원
- [x] `google_fonts` - Google Fonts
- [x] `flutter_staggered_animations` - 애니메이션

#### 유틸리티 패키지
- [x] `flutter_secure_storage` - 보안 저장소
- [x] `shared_preferences` - 설정 저장
- [x] `path_provider` - 파일 경로 관리

#### 개발 도구
- [x] `build_runner` - 코드 생성 도구
- [x] `freezed` - Freezed 코드 생성
- [x] `json_serializable` - JSON 직렬화 코드 생성

## 작업 순서

### Step 1: Flutter 프로젝트 생성
1. Flutter 프로젝트 생성
2. 기본 앱 구조 확인
3. 불필요한 파일 정리

### Step 2: 폴더 구조 생성
1. Clean Architecture 폴더 구조 생성
2. 기본 파일들 생성 (빈 파일로 시작)
3. 폴더 구조 검증

### Step 3: 의존성 설정
1. pubspec.yaml 파일 수정
2. 필요한 패키지들 추가
3. [x] `flutter pub get` 실행

### Step 4: 기본 설정 파일 생성
1. .gitignore 파일 설정
2. README.md 파일 생성
3. 분석 설정 파일 생성

### Step 5: 개발 환경 검증
1. [x] `flutter doctor` 실행
2. [x] 에뮬레이터에서 기본 앱 실행 확인
3. [x] 빌드 테스트

## 예상 소요 시간
- **총 소요 시간**: 2-3시간
- **Step 1**: 30분
- **Step 2**: 1시간
- **Step 3**: 30분
- **Step 4**: 30분
- **Step 5**: 30분

## 완료 기준
- [x] Flutter 프로젝트가 정상적으로 생성됨
- [x] Clean Architecture 폴더 구조가 완성됨
- [x] 모든 필요한 패키지가 pubspec.yaml에 추가됨
- [x] 기본 앱이 에뮬레이터에서 정상 실행됨
- [x] Git 저장소가 정상적으로 초기화됨

## 다음 단계
이 작업이 완료되면 다음 이슈로 넘어갑니다:
- **2번 이슈**: 데이터베이스 설계 및 구현
- **3번 이슈**: 핵심 기능 구현

## 주의사항
- 모든 파일명은 snake_case 사용
- 클래스명은 PascalCase 사용
- 상수는 UPPER_SNAKE_CASE 사용
- 작은따옴표 사용 (Dart 스타일 가이드 준수)

---

*이 계획은 작업 진행 상황에 따라 조정될 수 있습니다.* 