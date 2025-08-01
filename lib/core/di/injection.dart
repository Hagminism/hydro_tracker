import 'package:get_it/get_it.dart';
import '../../data/datasources/local/database_helper.dart';
import '../../data/repositories/consumption_repository_impl.dart';
import '../../data/repositories/goal_repository_impl.dart';
import '../../data/repositories/user_settings_repository_impl.dart';
import '../../domain/repositories/consumption_repository_interface.dart';
import '../../domain/repositories/goal_repository_interface.dart';
import '../../domain/repositories/user_settings_repository_interface.dart';

/// 전역 GetIt 인스턴스
final GetIt getIt = GetIt.instance;

/// 의존성 주입을 초기화합니다.
Future<void> initializeDependencies() async {
  // Database Helper
  getIt.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  // Repositories
  getIt.registerLazySingleton<ConsumptionRepositoryInterface>(
    () => const ConsumptionRepositoryImpl(),
  );

  getIt.registerLazySingleton<GoalRepositoryInterface>(
    () => const GoalRepositoryImpl(),
  );

  getIt.registerLazySingleton<UserSettingsRepositoryInterface>(
    () => const UserSettingsRepositoryImpl(),
  );
}

/// 의존성을 해제합니다.
Future<void> disposeDependencies() async {
  await getIt.reset();
} 