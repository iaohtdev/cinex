import 'package:cinex/core/theme/theme.dart';
import 'package:cinex/features/cinex/presentation/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:cinex/features/cinex/presentation/routers/app_pages.dart';
import 'package:cinex/features/cinex/presentation/routers/app_routes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => MoviesCubit(),
          ),
          BlocProvider(
            create: (context) => DetailMovieCubit(),
          ),
          BlocProvider(
            create: (context) => DiscoverCubit(),
          ),
          BlocProvider(
            create: (context) => NaviBarCubit(),
          ),
          BlocProvider(
            create: (context) => SearchCubit(),
          ),
          BlocProvider(
            create: (context) => TVCubit(),
          ),
          BlocProvider(
            create: (context) => DetailTVCubit(),
          ),
          BlocProvider(
            create: (context) => EpisodeCubit(),
          ),
          BlocProvider(
            create: (context) => TrailerCubit(),
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
