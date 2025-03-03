import 'package:bookly_app/core/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Bookly',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.primaryColor,
      ),
      home: const SplashView(),
    );
  }
}
