import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'book_banner_item.dart';
import 'pricing_container.dart';
import 'rating.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({
    super.key,
  });

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
            imageUrl: "https://picsum.photos/seed/picsum/200/300",
          ),
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
        RatingWithNumbers(
          rating: "4.5",
          totalRatings: "100",
        ),
        PricingContainer(),
      ],
    );
  }
}
