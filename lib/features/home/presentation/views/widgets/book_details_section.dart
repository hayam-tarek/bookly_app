import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'book_actions.dart';
import 'book_banner_item.dart';
import 'rating.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 8,
      children: [
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.55,
          height: MediaQuery.sizeOf(context).height * 0.35,
          child: BookBannerItem(
            imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
          ),
        ),
        Text(
          book.volumeInfo!.title!,
          style: TextStyles.textStyle22Bold,
          textAlign: TextAlign.center,
        ),
        Text(
          "${book.volumeInfo!.authors?.first}",
          style: TextStyles.textStyle16.copyWith(
            color: Colors.grey,
            fontStyle: FontStyle.italic,
          ),
        ),
        RatingWithNumbers(
          rating: book.volumeInfo!.averageRating ?? 0.0,
          totalRatings: book.volumeInfo!.ratingsCount ?? 0,
        ),
        BookActions(book: book),
      ],
    );
  }
}
