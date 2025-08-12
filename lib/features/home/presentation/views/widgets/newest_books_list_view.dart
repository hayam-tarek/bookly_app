import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/fake_book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/book_card_info.dart';

class NewestBooksListView extends StatefulWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  State<NewestBooksListView> createState() => _NewestBooksListViewState();
}

class _NewestBooksListViewState extends State<NewestBooksListView> {
  List<BookModel> books = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewestBooksCubit, NewestBooksState>(
      listener: (context, state) {
        if (state is NewestBooksSuccess) {
          books = state.books;
        }
      },
      builder: (context, state) {
        if (state is NewestBooksSuccess ||
            state is NewestBooksLoadingMore ||
            state is NewestBooksNoMoreData) {
          return NewestBooksListViewBuilder(books: books);
        } else if (state is NewestBooksFailure) {
          return SliverFillRemaining(
            child: CustomErrorWidget(message: state.message),
          );
        } else if (state is NewestBooksLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: NewestBooksListViewBuilder(
              books: List.generate(3, (index) => fakeBookModel),
            ),
          );
        } else {
          return SliverToBoxAdapter(
            child: Container(),
          );
        }
      },
    );
  }
}

class NewestBooksListViewBuilder extends StatelessWidget {
  const NewestBooksListViewBuilder({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: books.length,
      itemBuilder: (context, index) => BookCardInfo(
        book: books[index],
      ),
    );
  }
}
