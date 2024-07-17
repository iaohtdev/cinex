import 'package:cinex/data/models/movie_model.dart';
import 'package:cinex/data/models/tv_model.dart';
import 'package:cinex/presentation/views/detail/tv/tv_detail_screen.dart';
import 'package:cinex/presentation/views/search/search_screen.dart';
import 'package:cinex/presentation/views/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:cinex/core/router/app_routes.dart';
import 'package:cinex/presentation/views/home/home_screen.dart';
import 'package:cinex/presentation/views/detail/movie/movie_detail_screen.dart';
import 'package:cinex/presentation/views/navibar/navibar_screen.dart';
import 'package:cinex/presentation/views/welcome/welcome_screen.dart';

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const SplashScreen());
      case Routes.home:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                HomeScreen());
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
      case Routes.tvDetail:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) {
          final arguments = settings.arguments as Map<String, dynamic>? ?? {};
          final tv = arguments['tv'] as TVModel;

          return TvDetailScreen(
            tv: tv,
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
