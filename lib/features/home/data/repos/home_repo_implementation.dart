import 'dart:nativewrappers/_internal/vm/lib/developer.dart';

import 'package:bookly_app/api/api_service.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> getBanners() {
    // TODO: implement getBestSellersBooks
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> getNewestBooks() async {
    try {
      var data = await apiService.get(endPoint: Endpoints.getNewestBooks);
      List<BookModel> newestBooks = [];
      for (var item in data[ApiKeys.items]) {
        newestBooks.add(BookModel.fromJson(item));
      }
      log('newestBooks: $newestBooks');
      return Right(newestBooks);
    } on Exception catch (e) {
      return Left(ServerFailure());
    }
  }
}
