import 'package:cinex/cubits/cubits.dart';
import 'package:flutter/material.dart';
import 'package:cinex/routers/app_pages.dart';
import 'package:cinex/routers/app_routes.dart';
import 'package:cinex/utils/style/app_textstyle.dart';
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
          theme: ThemeData(
              fontFamily: AppTextStyles.fontRegular,
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: const AppBarTheme(
                  backgroundColor: Colors.black,
                  surfaceTintColor: Colors.black)),
          onGenerateRoute: AppPages.onGenerateRoute,
          initialRoute: Routes.splash,
        ));
  }
}
