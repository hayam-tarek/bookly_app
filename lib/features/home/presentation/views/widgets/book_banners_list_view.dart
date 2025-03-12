import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/presentation/view_model/featured_books/featured_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_banner_item.dart';

class BookBannersListView extends StatelessWidget {
  BookBannersListView({super.key});
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: CarouselView(
              controller: _carouselController,
              itemExtent: MediaQuery.sizeOf(context).width * 0.40,
              children: List.generate(
                state.books.length,
                (index) => BookBannerItem(
                  imageUrl:
                      state.books[index].volumeInfo!.imageLinks!.thumbnail!,
                ),
              ),
            ),
          );
        } else if (state is FeaturedBooksFailure) {
          return Center(
            child: CustomErrorWidget(message: state.message),
          );
        } else if (state is FeaturedBooksLoading) {
          return const Center(
            child: CustomLoadingWidget(),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
