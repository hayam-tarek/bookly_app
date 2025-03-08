import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'book_details_appbar.dart';
import 'book_details_section.dart';
import 'similar_books_list_view.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BookDetailsAppBar(),
          BookDetailsSection(),
          Spacer(flex: 1),
          Text(
            "You can also like",
            style: TextStyles.textStyle16Bold,
          ),
          Expanded(
            flex: 2,
            child: SimilarBooksListView(),
          ),
        ],
      ),
    );
  }
}
