import 'package:cinex/core/config/dio_config.dart';
import 'package:cinex/data/datasources/cast_remote_data_source.dart';
import 'package:cinex/data/datasources/discover_remote_data_source.dart';
import 'package:cinex/data/datasources/movie_remote_data_source.dart';
import 'package:cinex/data/datasources/search_remote_data_source.dart';
import 'package:cinex/data/datasources/trailer_remote_data_source.dart';
import 'package:cinex/data/datasources/tv_remote_data_source.dart';
import 'package:cinex/data/repositories/cast_repository_impl.dart';
import 'package:cinex/data/repositories/discover_repository_impl.dart';
import 'package:cinex/data/repositories/movie_repository_impl.dart';
import 'package:cinex/data/repositories/search_repository_impl.dart';
import 'package:cinex/data/repositories/trailer_repository_impl.dart';
import 'package:cinex/data/repositories/tv_repository_impl.dart';
import 'package:cinex/domain/repositories/repositories.dart';
import 'package:cinex/domain/repositories/trailer_repository.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() async {
  // Initialize Hive
  // await Hive.initFlutter();
  // Hive.registerAdapter(ProductItemAdapter());
  // final favoritesBox = await Hive.openBox<ProductItem>('favorites');
  getIt.registerLazySingleton<Dio>(() => Dio(
        DioConfig.options,
      ));

  //register repository
  getIt
      .registerLazySingleton<CastRepository>(() => CastRepositoryImpl(getIt()));
  getIt.registerLazySingleton<DiscoverRepository>(
      () => DiscoverRepositoryImpl(discoverRemoteDataSource: getIt()));
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(movieRemoteDataSource: getIt()));
  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(searchRemoteDataSource: getIt()));
  getIt.registerLazySingleton<TrailerRepository>(
      () => TrailerRepositoryImpl(trailerRemoteDataSource: getIt()));
  getIt.registerLazySingleton<TVRepository>(
      () => TVRepositoryImpl(tvRemoteDataSource: getIt()));

  // Data Source
  getIt.registerLazySingleton<CastRemoteDataSource>(
      () => CastRemoteDataSourceImpl());
  getIt.registerLazySingleton<DiscoverRemoteDataSource>(
      () => DiscoverRemoteDataSourceImpl());
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl());
  getIt.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl());
  getIt.registerLazySingleton<TrailerRemoteDataSource>(
      () => TrailerRemoteDataSourceImpl());
  getIt.registerLazySingleton<TVRemoteDataSource>(
      () => TVRemoteDataSourceImpl());
}

Dio get dio => getIt<Dio>();
