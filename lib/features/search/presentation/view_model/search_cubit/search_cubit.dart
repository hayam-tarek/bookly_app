import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepo) : super(SearchInitial());
  final SearchRepo searchRepo;
  List<BookModel> books = [];

  Future<void> searchBooks({required String query}) async {
    emit(SearchLoading());
    var result = await searchRepo.searchBooks(query: query);
    result.fold(
      (failure) => emit(SearchFailure(message: failure.message)),
      (books) => emit(SearchSuccess(books: books)),
    );
  }
}
