import 'package:cinex/core/theme/theme.dart';
import 'package:cinex/di.dart';
import 'package:cinex/domain/repositories/repositories.dart';
import 'package:cinex/domain/repositories/trailer_repository.dart';
import 'package:cinex/domain/repositories/tv_repository.dart';
import 'package:cinex/presentation/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:cinex/core/router/app_pages.dart';
import 'package:cinex/core/router/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoviesCubit(getIt<MovieRepository>()),
          ),
          BlocProvider(
            create: (context) => DetailMovieCubit(
                getIt<CastRepository>(), getIt<MovieRepository>()),
          ),
          BlocProvider(
            create: (context) => DiscoverCubit(getIt<DiscoverRepository>()),
          ),
          BlocProvider(
            create: (context) => NaviBarCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(getIt<SearchRepository>()),
          ),
          BlocProvider(
            create: (context) => TVCubit(getIt<TVRepository>()),
          ),
          BlocProvider(
            create: (context) =>
                DetailTVCubit(getIt<CastRepository>(), getIt<TVRepository>()),
          ),
          BlocProvider(
            create: (context) => EpisodeCubit(getIt<TVRepository>()),
          ),
          BlocProvider(
            create: (context) => TrailerCubit(getIt<TrailerRepository>()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: AppTheme.themeApp,
          onGenerateRoute: AppPages.onGenerateRoute,
          initialRoute: Routes.splash,
        ));
  }
}
