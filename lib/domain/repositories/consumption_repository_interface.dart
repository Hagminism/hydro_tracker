import '../entities/consumption_record_entity.dart';

/// 섭취 기록 repository 인터페이스
abstract interface class ConsumptionRepositoryInterface {
  /// 모든 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getAllRecords();

  /// 특정 날짜의 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecordsByDate(DateTime date);

  /// 특정 기간의 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecordsByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// 특정 물질의 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecordsBySubstance(String substance);

  /// 특정 물질과 날짜의 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecordsBySubstanceAndDate(
    String substance,
    DateTime date,
  );

  /// 섭취 기록을 추가합니다.
  Future<int> addRecord(ConsumptionRecordEntity record);

  /// 섭취 기록을 업데이트합니다.
  Future<void> updateRecord(ConsumptionRecordEntity record);

  /// 섭취 기록을 삭제합니다.
  Future<void> deleteRecord(int id);

  /// 특정 날짜의 총 섭취량을 계산합니다.
  Future<Map<String, double>> getTotalConsumptionByDate(DateTime date);

  /// 특정 기간의 총 섭취량을 계산합니다.
  Future<Map<String, double>> getTotalConsumptionByDateRange(
    DateTime startDate,
    DateTime endDate,
  );

  /// 특정 물질의 특정 기간 총 섭취량을 계산합니다.
  Future<double> getTotalConsumptionBySubstanceAndDateRange(
    String substance,
    DateTime startDate,
    DateTime endDate,
  );

  /// 최근 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecentRecords({int limit = 10});

  /// 특정 물질의 최근 섭취 기록을 가져옵니다.
  Future<List<ConsumptionRecordEntity>> getRecentRecordsBySubstance(
    String substance, {
    int limit = 10,
  });
}
