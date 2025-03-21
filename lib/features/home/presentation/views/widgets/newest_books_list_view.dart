import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/fake_book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/newest_books/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/widgets/book_card_info.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return NewestBooksListViewBuilder(books: state.books);
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
