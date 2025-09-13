import 'package:coderoof_assignment/Screens/home_screen.dart';
import 'package:coderoof_assignment/Screens/subscription_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/';
  static const String subscription = '/subscription';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return _buildPageRoute(const Homepage(), settings);
      case subscription:
        return _buildPageRoute(const SubscriptionScreen(), settings);
      default:
        return _buildPageRoute(
          const Scaffold(
            body: Center(child: Text("No route defined")),
          ),
          settings,
        );
    }
  }

  /// 🔹 Custom PageRoute with smooth animation
  static PageRouteBuilder _buildPageRoute(Widget page, RouteSettings settings) {
    return PageRouteBuilder(
      settings: settings,
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (_, animation, secondaryAnimation) => page,
      transitionsBuilder: (_, animation, secondaryAnimation, child) {
        // Fade + Slide from right
        const beginOffset = Offset(1.0, 0.0);
        const endOffset = Offset.zero;
        final tween = Tween(begin: beginOffset, end: endOffset)
            .chain(CurveTween(curve: Curves.easeOutCubic));

        return FadeTransition(
          opacity: animation,
          child: SlideTransition(position: animation.drive(tween), child: child),
        );
      },
    );
  }
}
