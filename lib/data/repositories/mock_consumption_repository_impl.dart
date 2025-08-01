import '../../core/result/result.dart';
import '../../domain/entities/consumption_record_entity.dart';
import '../../domain/repositories/consumption_repository.dart';

/// Mock ConsumptionRepository 구현체
///
/// 테스트 및 개발 단계에서 사용할 Mock 데이터를 제공합니다.
class MockConsumptionRepositoryImpl implements ConsumptionRepository {
  late final List<ConsumptionRecordEntity> _mockRecords =
      _initializeMockRecords();

  List<ConsumptionRecordEntity> _initializeMockRecords() {
    return [
      ConsumptionRecordEntity(
        id: 1,
        substance: 'water',
        amount: 500.0,
        unit: 'ml',
        timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        memo: '아침 운동 후',
      ),
      ConsumptionRecordEntity(
        id: 2,
        substance: 'caffeine',
        amount: 200.0,
        unit: 'ml',
        timestamp: DateTime.now().subtract(const Duration(hours: 1)),
        memo: '커피',
      ),
      ConsumptionRecordEntity(
        id: 3,
        substance: 'water',
        amount: 300.0,
        unit: 'ml',
        timestamp: DateTime.now().subtract(const Duration(minutes: 30)),
        memo: '점심 식사 후',
      ),
    ];
  }

  @override
  Future<Result<List<ConsumptionRecordEntity>, Exception>>
  getAllRecords() async {
    try {
      // 시뮬레이션된 네트워크 지연
      await Future.delayed(const Duration(milliseconds: 100));
      return Result.success(_mockRecords);
    } catch (e) {
      return Result.failure(Exception('기록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<ConsumptionRecordEntity?, Exception>> getRecordById(
    int id,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      final record = _mockRecords
          .where((record) => record.id == id)
          .firstOrNull;
      return Result.success(record);
    } catch (e) {
      return Result.failure(Exception('기록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<List<ConsumptionRecordEntity>, Exception>>
  getRecordsByDateRange(DateTime startDate, DateTime endDate) async {
    try {
      await Future.delayed(const Duration(milliseconds: 80));
      final filteredRecords = _mockRecords.where((record) {
        return record.timestamp.isAfter(
              startDate.subtract(const Duration(seconds: 1)),
            ) &&
            record.timestamp.isBefore(endDate.add(const Duration(seconds: 1)));
      }).toList();
      return Result.success(filteredRecords);
    } catch (e) {
      return Result.failure(Exception('기간별 기록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<List<ConsumptionRecordEntity>, Exception>>
  getRecordsBySubstance(String substance) async {
    try {
      await Future.delayed(const Duration(milliseconds: 60));
      final filteredRecords = _mockRecords
          .where((record) => record.substance == substance)
          .toList();
      return Result.success(filteredRecords);
    } catch (e) {
      return Result.failure(Exception('물질별 기록 조회 실패: $e'));
    }
  }

  @override
  Future<Result<int, Exception>> addRecord(
    ConsumptionRecordEntity record,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 120));
      final newId = _mockRecords.isEmpty ? 1 : (_mockRecords.last.id + 1);
      final newRecord = ConsumptionRecordEntity(
        id: newId,
        substance: record.substance,
        amount: record.amount,
        unit: record.unit,
        timestamp: record.timestamp,
        memo: record.memo,
      );
      _mockRecords.add(newRecord);
      return Result.success(newId);
    } catch (e) {
      return Result.failure(Exception('기록 추가 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> updateRecord(
    ConsumptionRecordEntity record,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 100));
      final index = _mockRecords.indexWhere((r) => r.id == record.id);
      if (index != -1) {
        _mockRecords[index] = record;
        return Result.success(null);
      } else {
        return Result.failure(Exception('수정할 기록을 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('기록 수정 실패: $e'));
    }
  }

  @override
  Future<Result<void, Exception>> deleteRecord(int id) async {
    try {
      await Future.delayed(const Duration(milliseconds: 80));
      final index = _mockRecords.indexWhere((r) => r.id == id);
      if (index != -1) {
        _mockRecords.removeAt(index);
        return Result.success(null);
      } else {
        return Result.failure(Exception('삭제할 기록을 찾을 수 없습니다.'));
      }
    } catch (e) {
      return Result.failure(Exception('기록 삭제 실패: $e'));
    }
  }

  @override
  Future<Result<Map<String, double>, Exception>> getTotalConsumptionByPeriod(
    DateTime startDate,
    DateTime endDate,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 90));
      final records = _mockRecords.where((record) {
        return record.timestamp.isAfter(
              startDate.subtract(const Duration(seconds: 1)),
            ) &&
            record.timestamp.isBefore(endDate.add(const Duration(seconds: 1)));
      }).toList();

      final totals = <String, double>{};
      for (final record in records) {
        totals[record.substance] =
            (totals[record.substance] ?? 0.0) + record.amount;
      }
      return Result.success(totals);
    } catch (e) {
      return Result.failure(Exception('총 섭취량 계산 실패: $e'));
    }
  }

  @override
  Future<Result<Map<String, double>, Exception>> getTodayConsumption() async {
    try {
      await Future.delayed(const Duration(milliseconds: 70));
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final todayRecords = _mockRecords.where((record) {
        return record.timestamp.isAfter(
              startOfDay.subtract(const Duration(seconds: 1)),
            ) &&
            record.timestamp.isBefore(endOfDay);
      }).toList();

      final totals = <String, double>{};
      for (final record in todayRecords) {
        totals[record.substance] =
            (totals[record.substance] ?? 0.0) + record.amount;
      }
      return Result.success(totals);
    } catch (e) {
      return Result.failure(Exception('오늘 섭취량 조회 실패: $e'));
    }
  }

  @override
  Future<Result<double, Exception>> getTodayConsumptionBySubstance(
    String substance,
  ) async {
    try {
      await Future.delayed(const Duration(milliseconds: 50));
      final today = DateTime.now();
      final startOfDay = DateTime(today.year, today.month, today.day);
      final endOfDay = startOfDay.add(const Duration(days: 1));

      final todayRecords = _mockRecords.where((record) {
        return record.substance == substance &&
            record.timestamp.isAfter(
              startOfDay.subtract(const Duration(seconds: 1)),
            ) &&
            record.timestamp.isBefore(endOfDay);
      }).toList();

      final total = todayRecords.fold<double>(
        0.0,
        (sum, record) => sum + record.amount,
      );
      return Result.success(total);
    } catch (e) {
      return Result.failure(Exception('물질별 오늘 섭취량 조회 실패: $e'));
    }
  }
}
