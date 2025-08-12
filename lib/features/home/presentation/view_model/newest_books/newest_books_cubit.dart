import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'newest_books_state.dart';

class NewestBooksCubit extends Cubit<NewestBooksState> {
  NewestBooksCubit(this.homeRepo) : super(NewestBooksInitial());

  final HomeRepo homeRepo;
  List<BookModel> books = [];
  final int pageSize = 10;
  int pageNumber = 0;
  bool isLoadingMore = false;

  Future<void> fetchNewestBooks() async {
    emit(NewestBooksLoading());
    var result = await homeRepo.getNewestBooks();
    result.fold(
      (failure) => emit(NewestBooksFailure(failure.message)),
      (books) => emit(NewestBooksSuccess(books)),
    );
  }

  Future<void> fetchMoreNewestBooks() async {
    final currentState = state;
    if (isLoadingMore || currentState is! NewestBooksSuccess) return;

    isLoadingMore = true;
    pageNumber++;

    emit(NewestBooksLoadingMore());

    var result = await homeRepo.getNewestBooks(pageNumber: pageNumber);
    result.fold(
      (failure) {
        isLoadingMore = false;
        pageNumber--;
        emit(NewestBooksNoMoreData(failure.message));
      },
      (books) {
        this.books = (currentState).books + books;
        emit(currentState.copyWith(books: this.books));
        isLoadingMore = false;
      },
    );
  }
}
