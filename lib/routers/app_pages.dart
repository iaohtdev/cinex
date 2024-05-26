import 'package:flutter/material.dart';
import 'package:image_generator/routers/app_routes.dart';
import 'package:image_generator/screen/home/home_screen.dart';
import 'package:image_generator/screen/modules/chat/screen/home_chat_screen.dart';
import 'package:image_generator/screen/modules/text_to_image/screen/result_tti_screen.dart';
import 'package:image_generator/screen/modules/text_to_image/screen/home_tti_screen.dart';
import 'package:image_generator/screen/modules/text_to_image/screen/more_art_style_screen.dart';
import 'package:image_generator/screen/welcome/welcome_screen.dart';

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
      case Routes.ttiHome:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const TTIHomeScreen());
      case Routes.moreArtStyle:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const MoreArtStyleScreen());
      case Routes.resultTTI:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ResultTTIScreen());

      //CHAT MODULES
      case Routes.chatHome:
        return customPageRoute(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const ChatHomeScreen());
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
