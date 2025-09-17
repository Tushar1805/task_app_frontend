import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:task_app/presentation/auth/view/splash_screen.dart';
import 'package:task_app/presentation/dashboard/view/home.dart';
import 'package:task_app/routes/app_routes.dart';
import 'package:task_app/routes/error_screen.dart';

CustomTransitionPage<T> slideTransitionPage<T>({
  required final Widget child,
  required final LocalKey key,
}) =>
    CustomTransitionPage<T>(
      key: key,
      child: child,
      transitionsBuilder: (final context, final animation, final secondaryAnimation, final child) {
        final offsetAnimation = Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).chain(CurveTween(curve: Curves.easeInOut)).animate(animation);

        return SlideTransition(position: offsetAnimation, child: child);
      },
    );

final GoRouter router = GoRouter(
  initialLocation: splashScreen,
  errorBuilder: (final context, final state) => const ErrorScreen(),
  routes: [
    GoRoute(
      name: splashScreen,
      path: splashScreen,
      pageBuilder: (final context, final state) => slideTransitionPage(
        key: state.pageKey,
        child: SplashScreen(),
      ),
    ),

    GoRoute(
      name: homeScreen,
      path: homeScreen,
      pageBuilder: (final context, final state) => slideTransitionPage(
        key: state.pageKey,
        child: HomeScreen(),
      ),
    ),

    // GoRoute(
    //   name: setLanguageScreen,
    //   path: setLanguageScreen,
    //   pageBuilder: (final context, final state) {
    //     final params = state.extra as Map<String, dynamic>?;
    //     return slideTransitionPage(
    //       key: state.pageKey,
    //       child: SelectLangScreen(
    //         onPop: params?['onPop'] as bool?,
    //       ),
    //     );
    //   },
    // ),
  ],
);
