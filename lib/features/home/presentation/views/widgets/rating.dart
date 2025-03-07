import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class RatingWithNumbers extends StatelessWidget {
  const RatingWithNumbers({
    super.key,
  });

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
          " 4.5 ",
          style: TextStyles.textStyle16Bold,
        ),
        Text(
          "(1000)",
          style: TextStyles.textStyle14,
        ),
      ],
    );
  }
}
