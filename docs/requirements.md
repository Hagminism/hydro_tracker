# HydroTracker - 자극물 섭취량 추적 앱 요건 정의

## 프로젝트 개요
수분, 카페인, 알코올, 니코틴 등 자극물의 일일 섭취량을 추적하고 관리하는 Flutter 모바일 애플리케이션

## 핵심 기능 요구사항

### 1. 추적 대상 물질
- **수분**: 리터(L) 단위로 추적
- **카페인**: 밀리그램(mg) 단위로 추적  
- **알코올**: 표준 음료 단위로 추적 (잔, 병, 캔 등)
- **니코틴**: 개비 단위로 추적

### 2. 데이터 입력 방식
- 수동 입력 (양, 시간, 메모)
- 빠른 입력 버튼 (자주 사용하는 항목)
- 음성 입력 지원 (선택사항)

### 3. 목표 설정 및 알림
- 일일 목표량 설정
- 목표 달성/미달성 알림
- 과다 섭취 경고 알림
- 정기적인 섭취 알림

### 4. 데이터 시각화
- 일일/주간/월간 섭취량 차트
- 목표 대비 진행률 표시
- 트렌드 분석 그래프

### 5. 데이터 관리
- 로컬 데이터 저장
- 데이터 백업/복원
- 데이터 내보내기 (CSV, PDF)

## 사용자 경험 요구사항

### 6. UI/UX
- 직관적이고 사용하기 쉬운 인터페이스
- 다크모드/라이트모드 지원
- 접근성 고려 (글자 크기 조절 등)

### 7. 성능
- 빠른 앱 시작 시간
- 부드러운 애니메이션
- 배터리 효율성

## 기술적 요구사항

### 8. 플랫폼 지원
- Android (API 21 이상)
- iOS (iOS 12.0 이상)

### 9. 오프라인 지원
- 인터넷 연결 없이도 모든 기능 사용 가능
- 데이터 동기화 (선택사항)

### 10. 보안 및 개인정보
- 로컬 데이터 암호화
- 개인정보 수집 최소화
- GDPR 준수

## 추가 고려사항

### 11. 확장성
- 새로운 추적 대상 물질 추가 가능
- 커스텀 단위 설정 가능
- 플러그인 시스템 (향후 고려)

---


## 질문 사항 (사용자 확인 필요)

1. **추적 대상 물질**: 위 4가지 외에 추가로 추적하고 싶은 물질이 있나요?
2. **입력 방식**: 바코드 스캔 기능이 필요한가요?
3. **알림 설정**: 알림 주기와 방식에 대한 구체적인 선호도가 있나요?
4. **데이터 공유**: 소셜 미디어 공유 기능이 필요한가요?
5. **웹 버전**: 모바일 앱 외에 웹 버전도 필요한가요?
6. **프리미엄 기능**: 유료 기능이 필요한가요? (광고 제거, 고급 분석 등)

## 개발 우선순위

### Phase 1 (MVP)
- 기본 섭취량 입력/수정/삭제
- 일일 목표 설정
- 기본 차트 표시
- 로컬 데이터 저장 (sqflite)
- Freezed를 사용한 불변 데이터 모델
- Result 패턴을 사용한 Repository 구현
- GetIt을 사용한 의존성 주입
- GoRouter를 사용한 라우팅

### Phase 2
- 알림 기능
- 데이터 내보내기
- 다크모드

### Phase 3
- 고급 분석 기능
- 소셜 기능
- 웹 버전

---

*이 문서는 프로젝트 진행 중 지속적으로 업데이트됩니다.* 