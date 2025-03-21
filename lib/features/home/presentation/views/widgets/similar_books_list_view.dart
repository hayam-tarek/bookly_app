import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/fake_book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/related_books/related_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'book_banner_item.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RelatedBooksCubit, RelatedBooksState>(
      builder: (context, state) {
        if (state is RelatedBooksSuccess) {
          return SimilarBooksListViewBuilder(books: state.books);
        } else if (state is RelatedBooksFailure) {
          return Center(
            child: CustomErrorWidget(message: state.message),
          );
        } else if (state is RelatedBooksLoading) {
          return Skeletonizer(
            enabled: true,
            child: SimilarBooksListViewBuilder(
              books: List.generate(3, (index) => fakeBookModel),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}

class SimilarBooksListViewBuilder extends StatelessWidget {
  const SimilarBooksListViewBuilder({
    super.key,
    required this.books,
  });
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: books.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
          child: GestureDetector(
            onTap: () {
              GoRouter.of(context).pushReplacement(AppRouter.bookDetailsView,
                  extra: books[index]);
            },
            child: BookBannerItem(
              imageUrl: books[index].volumeInfo!.imageLinks?.thumbnail ?? '',
            ),
          ),
        );
      },
    );
  }
}
