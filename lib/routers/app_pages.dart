import 'package:cinex/cubits/movie/movies_cubit.dart';
import 'package:cinex/model/movie_model.dart';
import 'package:cinex/screen/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinex/routers/app_routes.dart';
import 'package:cinex/screen/home/home_screen.dart';
import 'package:cinex/screen/movie_detail/movie_detail_screen.dart';
import 'package:cinex/screen/navibar/navibar_screen.dart';
import 'package:cinex/screen/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                BlocProvider(
                  create: (context) => MoviesCubit()..fetchMovie(),
                  child: HomeScreen(),
                ));
      case Routes.welcome:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const WelcomeScreen());
      case Routes.navibarCineX:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const NavibarCineX());
      case Routes.movieDetail:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) {
          final arguments = settings.arguments as Map<String, dynamic>? ?? {};
          final movie = arguments['movie'] as MovieModel;

          return MovieDetailScreen(
            movie: movie,
          );
        });
      case Routes.search:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SearchScreen());
      default:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const WelcomeScreen());
    }
  }
}

customPageRoute(
    {required Widget Function(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
    ) pageBuilder,
    RouteSettings? settings}) {
  return PageRouteBuilder(
      settings: settings,
      pageBuilder: pageBuilder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
      transitionDuration: const Duration(milliseconds: 200));
}
