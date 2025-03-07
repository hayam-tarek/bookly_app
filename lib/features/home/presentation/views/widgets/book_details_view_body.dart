import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'book_banner_item.dart';
import 'book_details_appbar.dart';
import 'pricing_container.dart';
import 'rating.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [
          BookDetailsAppBar(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5,
            height: MediaQuery.sizeOf(context).height * 0.3,
            child: BookBannerItem(),
          ),
          Text(
            "Book Title",
            style: TextStyles.textStyle26Bold,
          ),
          Text(
            "Author Name",
            style: TextStyles.textStyle16.copyWith(
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
          RatingWithNumbers(),
          PricingContainer(),
        ],
      ),
    );
  }
}
