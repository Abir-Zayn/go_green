import 'package:flutter/material.dart';
import 'package:go_green/Pages/Splash_Screen/views/display_logo.dart';
import 'package:go_green/Pages/Splash_Screen/views/splash_screen_one.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter _router =
     GoRouter(navigatorKey: navigatorKey, initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const DisplayLogo(),
  ),
  GoRoute(
      path: '/splashScreenOne',
      builder: (context, state) => const SplashScreenOne()),
]);

GoRouter get approuter => _router;
