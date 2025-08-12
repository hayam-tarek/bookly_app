import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> getNewestBooks({int pageNumber = 0});
  Future<Either<Failure, List<BookModel>>> getFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> getRelatedBooks({
    required String category,
  });
}
