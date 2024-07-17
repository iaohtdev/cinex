import 'package:cinex/features/cinex/data/network/dio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio(
        DioService.options,
      ));
}

// Getter to access Dio
Dio get dio => getIt<Dio>();
