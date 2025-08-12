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
      List<BookModel> featuredBooks = [];
      for (var item in data[ApiKeys.items]) {
        featuredBooks.add(BookModel.fromMap(item));
      }
      return Right(featuredBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks(
      {int pageNumber = 0}) async {
    try {
      var data = await apiService.get(
        endPoint: Endpoints.getNewestBooks(
          pageNumber: pageNumber,
        ),
      );
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
  Future<Either<Failure, List<BookModel>>> getRelatedBooks({
    required String category,
  }) async {
    try {
      var data = await apiService.get(
        endPoint: Endpoints.getRelatedBooks(category),
      );
      List<BookModel> relatedBooks = [];
      for (var item in data[ApiKeys.items]) {
        relatedBooks.add(BookModel.fromMap(item));
      }
      return Right(relatedBooks);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioException(e));
    } on Exception catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
