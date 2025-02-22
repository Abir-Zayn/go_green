import 'package:flutter/material.dart';
import 'package:go_green/Core/Constant/utils/shared_pref.dart';
import 'package:go_green/Pages/Auth/views/sign_in_page.dart';
import 'package:go_green/Pages/Auth/views/sign_up_page.dart';
import 'package:go_green/Pages/Home/views/home_screen.dart';
import 'package:go_green/Pages/Splash_Screen/Controllers/pageControllers.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/display_logo.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/splash_screen_one.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final GoRouter _router = GoRouter(
  navigatorKey: navigatorKey,
  initialLocation: '/',
  redirect: (context, state) async {
    // Get the SharedPrefManager instance
    final prefManager = await SharedPrefManager.getInstance();

    // Don't redirect for these paths
    final isAuthRoute =
        state.uri.toString() == '/login' || state.uri.toString() == '/signup';
    final isInitialRoute = state.uri.toString() == '/' ||
        state.uri.toString() == '/onboarding' ||
        state.uri.toString().startsWith('/splashScreen');

    // Check if we have a valid token
    final isAuthenticated = prefManager.isTokenValid();

    // If the user is not authenticated and trying to access protected routes
    if (!isAuthenticated && !isAuthRoute && !isInitialRoute) {
      return '/login';
    }

    // If the user is authenticated and trying to access auth routes
    if (isAuthenticated && isAuthRoute) {
      return '/home';
    }

    // Allow the navigation to proceed
    return null;
  },
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) =>
          const DisplayLogo(),
    ),
    GoRoute(
      path: '/onboarding',
      builder: (BuildContext context, GoRouterState state) =>
          const Pagecontrollers(),
    ),
    GoRoute(
      path: '/splashScreenOne',
      builder: (BuildContext context, GoRouterState state) =>
          const SplashScreenOne(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) =>
          const SignInPage(),
    ),
    GoRoute(
      path: '/signup',
      builder: (BuildContext context, GoRouterState state) {
        return const SignUpPage();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
  ],
);

GoRouter get approuter => _router;
