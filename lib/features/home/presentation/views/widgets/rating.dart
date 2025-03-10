import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class RatingWithNumbers extends StatelessWidget {
  const RatingWithNumbers({
    super.key,
    required this.rating,
    required this.totalRatings,
  });
  final String rating;
  final String totalRatings;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        ),
        Text(
          " $rating ",
          style: TextStyles.textStyle16Bold,
        ),
        Text(
          "($totalRatings)",
          style: TextStyles.textStyle14,
        ),
      ],
    );
  }
}
