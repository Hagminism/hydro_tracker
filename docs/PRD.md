# HydroTracker - 제품 요구사항 문서 (PRD)

## 1. 제품 개요

### 1.1 제품명
**HydroTracker** - 자극물 섭취량 추적 및 관리 앱

### 1.2 제품 설명
사용자가 일상에서 섭취하는 수분, 카페인, 알코올, 니코틴 등의 자극물을 체계적으로 추적하고 관리할 수 있는 Flutter 기반 모바일 애플리케이션입니다.

### 1.3 목표 사용자
- 건강 관리에 관심이 있는 일반 사용자
- 특정 물질의 섭취량을 제한하려는 사용자
- 건강한 생활습관을 만들고자 하는 사용자
- 의료진의 권고로 특정 물질 섭취를 모니터링해야 하는 사용자

### 1.4 핵심 가치 제안
- **간편한 추적**: 한 번의 탭으로 빠른 입력
- **직관적인 시각화**: 목표 대비 진행률을 한눈에 확인
- **개인화된 알림**: 사용자 맞춤형 알림 설정
- **데이터 기반 인사이트**: 장기적인 트렌드 분석

## 2. 기능 요구사항

### 2.1 핵심 기능

#### 2.1.1 추적 대상 물질
| 물질 | 단위 | 기본 목표량 | 측정 방식 |
|------|------|-------------|-----------|
| 수분 | 리터(L) | 2.0L/일 | 수동 입력 |
| 카페인 | 밀리그램(mg) | 400mg/일 | 수동 입력 |
| 알코올 | 표준 음료 단위 | 0-2잔/일 | 수동 입력 |
| 니코틴 | 개비 | 0개비/일 | 수동 입력 |

#### 2.1.2 데이터 입력 기능
- **수동 입력**
  - 양, 시간, 메모 입력
  - 커스텀 단위 설정 가능
  - 빠른 입력 버튼 (자주 사용하는 항목)
- **음성 입력** (Phase 2)
  - "물 500ml 마셨어" 형태의 자연어 입력
  - 음성 인식 및 자동 변환

#### 2.1.3 목표 설정 및 알림
- **일일 목표량 설정**
  - 각 물질별 개별 목표 설정
  - 주간/월간 목표 설정 (Phase 2)
- **알림 시스템**
  - 목표 달성 알림
  - 목표 미달성 알림
  - 과다 섭취 경고 알림
  - 정기적인 섭취 알림 (수분: 2시간마다)

### 2.2 데이터 시각화

#### 2.2.1 대시보드
- **일일 요약**
  - 각 물질별 현재 섭취량
  - 목표 대비 진행률 (원형 차트)
  - 남은 목표량 표시
- **주간/월간 뷰**
  - 라인 차트로 트렌드 표시
  - 평균 섭취량 비교

#### 2.2.2 차트 및 그래프
- **진행률 차트**: 목표 대비 달성률
- **트렌드 그래프**: 시간별 섭취량 변화
- **비교 차트**: 주간/월간 평균 비교

### 2.3 데이터 관리

#### 2.3.1 로컬 저장
- SQLite 데이터베이스 사용
- 섭취 기록, 목표 설정, 사용자 설정 저장
- 데이터 암호화 적용

#### 2.3.2 백업 및 복원
- 로컬 백업 파일 생성
- 클라우드 백업 (Phase 2)
- 데이터 내보내기 (CSV, PDF)

## 3. 사용자 인터페이스

### 3.1 화면 구성

#### 3.1.1 메인 화면
```
┌─────────────────────────────────┐
│ [설정] HydroTracker [알림]      │
├─────────────────────────────────┤
│ 오늘의 목표                      │
│ ┌─────┐ ┌─────┐ ┌─────┐ ┌─────┐ │
│ │수분 │ │카페인│ │알코올│ │니코틴│ │
│ │2.0L │ │400mg│ │0잔  │ │0개비│ │
│ │80%  │ │60%  │ │0%   │ │0%   │ │
│ └─────┘ └─────┘ └─────┘ └─────┘ │
├─────────────────────────────────┤
│ [물 추가] [커피 추가] [술 추가]   │
│ [담배 추가] [기타 추가]          │
├─────────────────────────────────┤
│ 최근 기록                        │
│ 14:30 물 500ml                  │
│ 12:15 커피 200ml                │
│ 10:00 물 300ml                  │
└─────────────────────────────────┘
```

#### 3.1.2 입력 화면
- **빠른 입력**: 자주 사용하는 항목 버튼
- **상세 입력**: 양, 시간, 메모 입력 폼
- **음성 입력**: 마이크 버튼 (Phase 2)

#### 3.1.3 통계 화면
- **일일 통계**: 원형 차트, 막대 그래프
- **주간 통계**: 라인 차트, 평균 비교
- **월간 통계**: 트렌드 분석

### 3.2 디자인 시스템

#### 3.2.1 색상 팔레트
- **Primary**: #2196F3 (파란색 - 수분)
- **Secondary**: #FF9800 (주황색 - 카페인)
- **Warning**: #F44336 (빨간색 - 알코올)
- **Danger**: #9C27B0 (보라색 - 니코틴)
- **Background**: #FFFFFF (라이트), #121212 (다크)
- **Surface**: #F5F5F5 (라이트), #1E1E1E (다크)

#### 3.2.2 타이포그래피
- **제목**: Roboto Bold, 24sp
- **부제목**: Roboto Medium, 18sp
- **본문**: Roboto Regular, 16sp
- **캡션**: Roboto Regular, 12sp

#### 3.2.3 아이콘
- Material Design Icons 사용
- 각 물질별 고유 아이콘
- 직관적인 액션 아이콘

## 4. 기술 아키텍처

### 4.1 기술 스택

#### 4.1.1 프론트엔드
- **Framework**: Flutter 3.x
- **Language**: Dart 3.x
- **State Management**: Riverpod
- **UI Framework**: Material Design 3

#### 4.1.2 백엔드
- **Database**: SQLite (로컬)
- **ORM**: sqflite (Flutter SQLite 패키지)
- **Encryption**: Flutter Secure Storage

#### 4.1.3 외부 라이브러리
- **Charts**: fl_chart
- **Notifications**: flutter_local_notifications
- **Permissions**: permission_handler
- **Dependency Injection**: get_it
- **Routing**: go_router
- **JSON Serialization**: json_annotation, json_serializable

### 4.2 데이터 모델

#### 4.2.1 핵심 엔티티
```dart
// 섭취 기록
@freezed
class ConsumptionRecord with _$ConsumptionRecord {
  const factory ConsumptionRecord({
    required int id,
    required String substance, // 'water', 'caffeine', 'alcohol', 'nicotine'
    required double amount,
    required String unit,
    required DateTime timestamp,
    String? memo,
  }) = _ConsumptionRecord;

  factory ConsumptionRecord.fromJson(Map<String, dynamic> json) =>
      _$ConsumptionRecordFromJson(json);
}

// 목표 설정
@freezed
class Goal with _$Goal {
  const factory Goal({
    required int id,
    required String substance,
    required double targetAmount,
    required String unit,
    required String period, // 'daily', 'weekly', 'monthly'
  }) = _Goal;

  factory Goal.fromJson(Map<String, dynamic> json) =>
      _$GoalFromJson(json);
}

// 사용자 설정
@freezed
class UserSettings with _$UserSettings {
  const factory UserSettings({
    required int id,
    required bool darkMode,
    required bool notifications,
    required Map<String, bool> notificationSettings,
  }) = _UserSettings;

  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);
}
```

#### 4.2.2 데이터베이스 스키마
```sql
-- 섭취 기록 테이블
CREATE TABLE consumption_records (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  substance TEXT NOT NULL,
  amount REAL NOT NULL,
  unit TEXT NOT NULL,
  timestamp DATETIME NOT NULL,
  memo TEXT
);

-- 목표 설정 테이블
CREATE TABLE goals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  substance TEXT NOT NULL,
  target_amount REAL NOT NULL,
  unit TEXT NOT NULL,
  period TEXT NOT NULL
);

-- 사용자 설정 테이블
CREATE TABLE user_settings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  dark_mode BOOLEAN DEFAULT FALSE,
  language TEXT DEFAULT 'ko',
  notifications BOOLEAN DEFAULT TRUE
);
```

### 4.3 폴더 구조
```
lib/
├── main.dart
├── app/
│   ├── app.dart
│   └── theme.dart
├── core/
│   ├── constants/
│   ├── utils/
│   └── extensions/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── pages/
│   ├── widgets/
│   └── providers/
└── shared/
    ├── widgets/
    └── services/
```

## 5. 성능 요구사항

### 5.1 응답 시간
- **앱 시작**: 3초 이내
- **화면 전환**: 300ms 이내
- **데이터 로딩**: 1초 이내

### 5.2 메모리 사용량
- **최대 메모리**: 100MB 이하
- **배터리 효율성**: 백그라운드에서 최소 배터리 소모

### 5.3 데이터 처리
- **로컬 저장**: 즉시 저장
- **백업**: 백그라운드에서 자동 실행
- **동기화**: 네트워크 상태에 따라 자동 동기화

## 6. 보안 및 개인정보

### 6.1 데이터 보안
- **로컬 암호화**: AES-256 암호화
- **민감 정보**: Flutter Secure Storage 사용
- **백업 파일**: 암호화된 형태로 저장

### 6.2 개인정보 보호
- **최소 수집**: 필수 데이터만 수집
- **사용자 동의**: 명시적 동의 후 데이터 수집
- **데이터 삭제**: 사용자 요청 시 즉시 삭제

## 7. 테스트 전략

### 7.1 테스트 유형
- **Unit Tests**: 비즈니스 로직 테스트
- **Widget Tests**: UI 컴포넌트 테스트
- **Integration Tests**: 전체 기능 테스트
- **Performance Tests**: 성능 테스트

### 7.2 테스트 커버리지
- **목표**: 80% 이상의 코드 커버리지
- **핵심 기능**: 100% 테스트 커버리지

## 8. 배포 및 유지보수

### 8.1 배포 계획
- **Phase 1**: 내부 테스트 버전
- **Phase 2**: 베타 테스트 버전
- **Phase 3**: 정식 출시

### 8.2 업데이트 정책
- **버그 수정**: 즉시 배포
- **기능 추가**: 월 1회 정기 업데이트
- **보안 패치**: 필요시 즉시 배포

## 9. 성공 지표

### 9.1 사용자 지표
- **일일 활성 사용자 (DAU)**
- **월간 활성 사용자 (MAU)**
- **사용자 유지율**
- **앱 평점**

### 9.2 기능 지표
- **데이터 입력 빈도**
- **목표 달성률**
- **알림 클릭률**
- **앱 사용 시간**

## 10. 위험 요소 및 대응 방안

### 10.1 기술적 위험
- **성능 이슈**: 코드 최적화 및 프로파일링
- **데이터 손실**: 정기 백업 및 복구 테스트
- **보안 취약점**: 정기 보안 감사

### 10.2 비즈니스 위험
- **사용자 이탈**: 지속적인 피드백 수집
- **경쟁 앱**: 차별화된 기능 개발
- **규제 변경**: 법적 요구사항 모니터링

---

*이 문서는 프로젝트 진행 중 지속적으로 업데이트됩니다.* 