part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<BookModel> books;
  SearchSuccess({required this.books});
}

final class SearchFailure extends SearchState {
  final String message;
  SearchFailure({required this.message});
}

final class SearchLoadingMore extends SearchState {}

final class SearchNoMoreData extends SearchState {
  final String message;
  SearchNoMoreData({required this.message});
}
