part of 'newest_books_cubit.dart';

@immutable
sealed class NewestBooksState {}

final class NewestBooksInitial extends NewestBooksState {}

final class NewestBooksSuccess extends NewestBooksState {
  final List<BookModel> books;
  NewestBooksSuccess(this.books);
}

final class NewestBooksFailure extends NewestBooksState {
  final String message;
  NewestBooksFailure(this.message);
}

final class NewestBooksLoading extends NewestBooksState {}
