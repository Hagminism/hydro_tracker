import '../../core/result/result.dart';
import '../entities/consumption_record_entity.dart';

/// 섭취 기록 Repository 인터페이스
///
/// 섭취 기록의 CRUD 작업을 담당합니다.
abstract interface class ConsumptionRepository {
  /// 모든 섭취 기록을 조회합니다.
  Future<Result<List<ConsumptionRecordEntity>, Exception>> getAllRecords();

  /// 특정 ID의 섭취 기록을 조회합니다.
  Future<Result<ConsumptionRecordEntity?, Exception>> getRecordById(int id);

  /// 특정 기간의 섭취 기록을 조회합니다.
  Future<Result<List<ConsumptionRecordEntity>, Exception>>
  getRecordsByDateRange(DateTime startDate, DateTime endDate);

  /// 특정 물질의 섭취 기록을 조회합니다.
  Future<Result<List<ConsumptionRecordEntity>, Exception>>
  getRecordsBySubstance(String substance);

  /// 섭취 기록을 추가합니다.
  Future<Result<int, Exception>> addRecord(ConsumptionRecordEntity record);

  /// 섭취 기록을 수정합니다.
  Future<Result<void, Exception>> updateRecord(ConsumptionRecordEntity record);

  /// 섭취 기록을 삭제합니다.
  Future<Result<void, Exception>> deleteRecord(int id);

  /// 특정 기간의 총 섭취량을 조회합니다.
  Future<Result<Map<String, double>, Exception>> getTotalConsumptionByPeriod(
    DateTime startDate,
    DateTime endDate,
  );

  /// 오늘의 섭취량을 조회합니다.
  Future<Result<Map<String, double>, Exception>> getTodayConsumption();

  /// 특정 물질의 오늘 섭취량을 조회합니다.
  Future<Result<double, Exception>> getTodayConsumptionBySubstance(
    String substance,
  );
}
