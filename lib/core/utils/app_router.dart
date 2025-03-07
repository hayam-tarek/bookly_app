import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:bookly_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static const String splashView = '/';
  static const String homeView = '/home';
  static const String bookDetailsView = '/book_details';

  static final router = GoRouter(
    routes: [
      _buildPage(splashView, const SplashView()),
      _buildPage(homeView, const HomeView()),
      _buildPage(bookDetailsView, BookDetailsView()),
    ],
  );

  static GoRoute _buildPage(String path, Widget page) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          );
        },
        transitionDuration: Duration(milliseconds: 300),
      ),
    );
  }
}
