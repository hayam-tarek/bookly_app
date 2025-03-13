import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
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
      _buildPage(splashView, (state) => const SplashView()),
      _buildPage(homeView, (state) => const HomeView()),
      _buildPage(
        bookDetailsView,
        (state) => BookDetailsView(book: state.extra as BookModel),
      ),
    ],
  );

  static GoRoute _buildPage(
    String path,
    Widget Function(GoRouterState) pageBuilder,
  ) {
    return GoRoute(
      path: path,
      pageBuilder: (context, state) => CustomTransitionPage(
        key: state.pageKey,
        child: pageBuilder(state),
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
