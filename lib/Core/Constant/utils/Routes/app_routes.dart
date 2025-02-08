import 'package:flutter/material.dart';
import 'package:go_green/Pages/Auth/views/sign_in_page.dart';
import 'package:go_green/Pages/Auth/views/sign_up_page.dart';
import 'package:go_green/Pages/Splash_Screen/Controllers/pageControllers.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/display_logo.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/splash_screen_one.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final GoRouter _router = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: '/',
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) =>
            const DisplayLogo(),
      ),
      GoRoute(
          path: '/onboarding',
          builder: (BuildContext context, GoRouterState state) =>
              const Pagecontrollers()),
      GoRoute(
          path: '/splashScreenOne',
          builder: (BuildContext context, GoRouterState state) =>
              const SplashScreenOne()),
      GoRoute(
          path: '/login',
          builder: (BuildContext context, GoRouterState state) =>
              const SignInPage()),
      GoRoute(
          path: '/signup',
          builder: (BuildContext context, GoRouterState state) {
            return const SignUpPage();
          }),
    ]);

GoRouter get approuter => _router;
