import 'package:bookly_app/core/api/dio_service.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<DioService>(
    DioService(),
  );
  getIt.registerSingleton<HomeRepoImplementation>(
    HomeRepoImplementation(getIt.get<DioService>()),
  );
  getIt.registerSingleton<SearchRepoImplementation>(
    SearchRepoImplementation(getIt.get<DioService>()),
  );
}
