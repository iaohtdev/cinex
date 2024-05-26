import 'package:flutter/material.dart';
import 'package:rate_movie/routers/app_pages.dart';
import 'package:rate_movie/routers/app_routes.dart';
import 'package:rate_movie/utils/style/app_textstyle.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: AppTextStyles.fontRegular,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.black, surfaceTintColor: Colors.black)),
      onGenerateRoute: AppPages.onGenerateRoute,
      initialRoute: Routes.navibarCineX,
    );
  }
}
