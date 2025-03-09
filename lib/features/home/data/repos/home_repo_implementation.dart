import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/api/end_points.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks() async {
    try {
      var data = await apiService.get(endPoint: Endpoints.getFeaturedBooks);
      List<BookModel> newestBooks = [];
      for (var item in data[ApiKeys.items]) {
        newestBooks.add(BookModel.fromMap(item));
      }
      return Right(newestBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: Endpoints.getNewestBooks);
      List<BookModel> newestBooks = [];
      for (var item in data[ApiKeys.items]) {
        newestBooks.add(BookModel.fromMap(item));
      }
      return Right(newestBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
