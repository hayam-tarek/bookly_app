import 'package:bookly_app/core/di/service_locator.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widgets/book_card_info.dart';
import 'package:bookly_app/core/widgets/custom_error_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_widget.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/search/data/repo/search_repo_implementation.dart';
import 'package:bookly_app/features/search/presentation/view_model/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<BookModel> listOfBooks = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.delete_outline_rounded),
        onPressed: () {
          query = '';
          showResults(context);
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchCubit(
        getIt.get<SearchRepoImplementation>(),
      )..searchBooks(query: query),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const Center(child: CustomLoadingWidget());
            } else if (state is SearchSuccess) {
              listOfBooks = state.books;
              return ListView.builder(
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return BookCardInfo(book: state.books[index]);
                },
              );
            } else if (state is SearchFailure) {
              return Center(
                child: CustomErrorWidget(message: state.message),
              );
            } else {
              return const Center(child: Text('No results found'));
            }
          },
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (listOfBooks.isEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: double.infinity),
          LottieBuilder.asset(
            AppAssets.bookAnimation,
            width: MediaQuery.sizeOf(context).width * .3,
          ),
          Text(
            "Search for a book",
            style: TextStyles.textStyle18Bold,
          ),
        ],
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: listOfBooks.length,
          itemBuilder: (context, index) {
            return BookCardInfo(book: listOfBooks[index]);
          },
        ),
      );
    }
  }
}
