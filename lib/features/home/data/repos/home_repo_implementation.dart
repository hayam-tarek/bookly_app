import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImplementation implements HomeRepo {
  @override
  Future<Either<Failure, List<BookModel>>> getBanners() {
    // TODO: implement getBanners
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<BookModel>>> getBestSellersBooks() {
    // TODO: implement getBestSellersBooks
    throw UnimplementedError();
  }
}
