import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  List<BookModel> books = [];
  final int pageSize = 10;
  int pageNumber = 0;
  bool isLoadingMore = false;

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (books) => emit(SearchSuccess(books: books)),
    );
  }

  Future<void> fetchMoreBooks({required String query}) async {
    final currentState = state;
    if (isLoadingMore || currentState is! SearchSuccess) return;

    isLoadingMore = true;
    pageNumber++;

    emit(SearchLoadingMore());

    var result =
        await searchRepo.searchBooks(query: query, pageNumber: pageNumber);
    result.fold(
      (failure) {
        isLoadingMore = false;
        pageNumber--;
        emit(SearchNoMoreData(message: failure.message));
      },
      (books) {
        this.books = (currentState).books + books;
        emit(SearchSuccess(books: this.books));
        isLoadingMore = false;
      },
    );
  }
}
