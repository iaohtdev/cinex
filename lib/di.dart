import 'package:cinex/data/network/dio_service.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<Dio>(() => Dio(
        DioService.options,
      ));
}

Dio get dio => getIt<Dio>();
