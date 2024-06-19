import 'package:flutter/material.dart';
import 'package:rate_movie/routers/app_routes.dart';
import 'package:rate_movie/screen/home/home_screen.dart';
import 'package:rate_movie/screen/movie_detail/movie_detail_screen.dart';
import 'package:rate_movie/screen/navibar/navibar_screen.dart';
import 'package:rate_movie/screen/welcome/welcome_screen.dart';

class AppPages {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen());
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
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MovieDetail());
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
      transitionDuration: const Duration(milliseconds: 100));
}
