import 'package:bookly_app/core/di/service_locator.dart';
import 'package:bookly_app/core/themes/app_colors.dart';
import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                NewestBooksCubit(getIt.get<HomeRepoImplementation>())
                  ..fetchNewestBooks()),
        BlocProvider(
            create: (context) =>
                FeaturedBooksCubit(getIt.get<HomeRepoImplementation>())
                  ..fetchFeaturedBooks()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Bookly',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
          colorScheme: ColorScheme.fromSeed(
            brightness: Brightness.dark,
            seedColor: AppColors.primaryColor,
            primary: AppColors.primaryColor,
            secondary: AppColors.secondaryColor,
          ),
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}
