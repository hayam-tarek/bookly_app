import 'package:bookly_app/core/di/service_locator.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo_implementation.dart';
import 'package:bookly_app/features/home/presentation/view_model/related_books/related_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/book_details_view_body.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => RelatedBooksCubit(
            getIt.get<HomeRepoImplementation>(),
          )..fetchRelatedBooks(category: book.volumeInfo!.categories![0]),
          child: BookDetailsViewBody(),
        ),
      ),
    );
  }
}
