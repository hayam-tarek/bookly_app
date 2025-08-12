import 'package:bookly_app/core/api/api_service.dart';
import 'package:bookly_app/core/api/end_points.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  final ApiService apiService;
  SearchRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> searchBooks(
      {required String query, int pageNumber = 0}) async {
    try {
      var data = await apiService.get(
          endPoint: Endpoints.getRelatedBooks(
        query,
        pageNumber: pageNumber,
      ));
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
