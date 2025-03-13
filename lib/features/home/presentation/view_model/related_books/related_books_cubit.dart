import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'related_books_state.dart';

class RelatedBooksCubit extends Cubit<RelatedBooksState> {
  RelatedBooksCubit(this.homeRepo) : super(RelatedBooksInitial());

  final HomeRepo homeRepo;
  List<BookModel> books = [];

  Future<void> fetchRelatedBooks({required String category}) async {
    emit(RelatedBooksLoading());
    var result = await homeRepo.getRelatedBooks(category: category);
    result.fold(
      (failure) => emit(RelatedBooksFailure(failure.message)),
      (books) => emit(RelatedBooksSuccess(books)),
    );
  }
}
