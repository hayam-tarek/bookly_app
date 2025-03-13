import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/models/book_model/fake_book_model.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'book_banner_item.dart';

class BookBannersListView extends StatelessWidget {
  const BookBannersListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return BookBannersListViewBuilder(books: state.books);
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorWidget(message: state.message),
          );
        } else if (state is FeaturedBooksLoading) {
          return Skeletonizer(
            enabled: true,
            child: BookBannersListViewBuilder(
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

class BookBannersListViewBuilder extends StatelessWidget {
  const BookBannersListViewBuilder({super.key, required this.books});
  final List<BookModel> books;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: CarouselView(
        itemExtent: MediaQuery.sizeOf(context).width * 0.40,
        children: List.generate(
          books.length,
          (index) => InkWell(
            onTap: () {
              GoRouter.of(context)
                  .push(AppRouter.bookDetailsView, extra: books[index]);
            },
            child: BookBannerItem(
              imageUrl: books[index].volumeInfo!.imageLinks!.thumbnail!,
            ),
          ),
        ),
      ),
    );
  }
}
