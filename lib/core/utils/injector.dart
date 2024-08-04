import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/auth/data/repositories/auth_repo_impl.dart';
import '../../features/auth/domain/repositories/auth_repo.dart';
import '../../features/auth/presentation/cubit/auth_cubit.dart';
import '../api/api_consumer.dart';
import '../api/dio_consumer.dart';
import '../services/cache_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupInjector() async {
  getIt.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(
      dio: Dio(),
    ),
  );
  final SharedPreferences pref = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => pref);

  getIt.registerLazySingleton<CacheService>(
    () => CacheServiceImpl(
      pref: getIt<SharedPreferences>(),
    ),
  );

  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      apiConsumer: getIt.get<ApiConsumer>(),
      cacheService: getIt.get<CacheService>(),
    ),
  );
  getIt.registerFactory(() => AuthCubit(authRepo: getIt()));
}
