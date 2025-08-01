# 2번 이슈: 데이터베이스 설계 및 구현 - 작업 계획

## 브랜치 정보
- **브랜치명**: `feature/database-design-implementation`
- **이슈 번호**: #2
- **작업자**: 이학민님

## 작업 개요
HydroTracker Flutter 앱의 데이터베이스 설계 및 구현을 완료합니다. sqflite를 사용하여 로컬 SQLite 데이터베이스를 구축하고, Repository 패턴을 통해 데이터 접근 계층을 구현합니다.

## 세부 작업 항목

### 2.1 SQLite 데이터베이스 설정
- [ ] sqflite 패키지 설정 확인 (이미 추가됨)
- [ ] 데이터베이스 스키마 정의
- [ ] 테이블 생성 스크립트 작성
- [ ] 마이그레이션 스크립트 작성

### 2.2 데이터 모델 구현
- [x] ConsumptionRecord 엔티티 구현 (Freezed 사용) - 이미 완료
- [x] Goal 엔티티 구현 (Freezed 사용) - 이미 완료
- [x] UserSettings 엔티티 구현 (Freezed 사용) - 이미 완료
- [ ] 데이터베이스 헬퍼 클래스 구현

### 2.3 Repository 패턴 구현 (Result 패턴 사용)
- [x] Result 클래스 정의 (Success/Failure) - 이미 완료
- [x] ConsumptionRepository 인터페이스 정의 - 이미 완료
- [x] GoalRepository 인터페이스 정의 - 이미 완료
- [x] UserSettingsRepository 인터페이스 정의 - 이미 완료
- [x] Repository 구현체 작성 (Mock 구현체) - 이미 완료
- [ ] 실제 Repository 구현체 작성 (sqflite 사용)

## 데이터베이스 스키마 설계

### 2.1.1 테이블 구조

#### consumption_records 테이블
```sql
CREATE TABLE consumption_records (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  substance TEXT NOT NULL, -- 'water', 'caffeine', 'alcohol', 'nicotine'
  amount REAL NOT NULL,
  unit TEXT NOT NULL,
  timestamp DATETIME NOT NULL,
  memo TEXT,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

#### goals 테이블
```sql
CREATE TABLE goals (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  substance TEXT NOT NULL,
  target_amount REAL NOT NULL,
  unit TEXT NOT NULL,
  period TEXT NOT NULL, -- 'daily', 'weekly', 'monthly'
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

#### user_settings 테이블
```sql
CREATE TABLE user_settings (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  dark_mode BOOLEAN DEFAULT FALSE,
  language TEXT DEFAULT 'ko',
  notifications BOOLEAN DEFAULT TRUE,
  notification_settings TEXT, -- JSON 형태로 저장
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
```

## 작업 순서

### Step 1: SQLite 데이터베이스 설정
1. 데이터베이스 헬퍼 클래스 생성
2. 테이블 정의 (SQL 스키마)
3. 데이터베이스 연결 설정
4. 마이그레이션 스크립트 작성

### Step 2: Repository 구현체 작성
1. ConsumptionRepositoryImpl 구현
2. GoalRepositoryImpl 구현
3. UserSettingsRepositoryImpl 구현
4. 의존성 주입 설정 (GetIt)

### Step 3: 데이터베이스 테스트
1. 기본 CRUD 작업 테스트
2. 쿼리 성능 테스트
3. 마이그레이션 테스트

### Step 4: 코드 생성 및 검증
1. `build_runner` 실행
2. 생성된 코드 검증
3. 컴파일 에러 수정

## 예상 소요 시간
- **총 소요 시간**: 3-4시간
- **Step 1**: 1.5시간
- **Step 2**: 1.5시간
- **Step 3**: 30분
- **Step 4**: 30분

## 완료 기준
- [ ] SQLite 데이터베이스가 정상적으로 설정됨
- [ ] 모든 테이블이 생성되고 정상 동작함
- [ ] Repository 구현체가 Mock에서 실제 구현으로 교체됨
- [ ] 기본 CRUD 작업이 정상 동작함
- [ ] 마이그레이션이 정상 동작함

## 다음 단계
이 작업이 완료되면 다음 이슈로 넘어갑니다:
- **3번 이슈**: 핵심 기능 구현 (UI 및 비즈니스 로직)
- **4번 이슈**: 상태 관리 및 Provider 구현

## 주의사항
- SQL 쿼리는 매개변수화하여 SQL 인젝션 방지
- Repository 구현체는 Result 패턴을 사용하여 에러 처리
- 데이터베이스 마이그레이션은 하위 호환성 고려
- 모든 쿼리는 인덱스를 고려하여 최적화

## 기술적 세부사항

### SQLite 설정
```dart
class DatabaseHelper {
  static Database? _database;
  
  static Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }
  
  static Future<Database> _initDatabase() async {
    final path = await getDatabasesPath();
    final dbPath = join(path, 'hydro_tracker.db');
    
    return await openDatabase(
      dbPath,
      version: 1,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );
  }
}
```

### Repository 구현 패턴
```dart
class ConsumptionRepositoryImpl implements ConsumptionRepository {
  final DatabaseHelper _databaseHelper;
  
  ConsumptionRepositoryImpl(this._databaseHelper);
  
  @override
  Future<Result<List<ConsumptionRecordEntity>>> getConsumptionRecords() async {
    try {
      final db = await _databaseHelper.database;
      final List<Map<String, dynamic>> maps = await db.query('consumption_records');
      
      final records = maps.map((map) => ConsumptionRecordEntity.fromMap(map)).toList();
      return Result.success(records);
    } catch (e) {
      return Result.failure(DatabaseException(e.toString()));
    }
  }
}
```

---

*이 계획은 작업 진행 상황에 따라 조정될 수 있습니다.* 