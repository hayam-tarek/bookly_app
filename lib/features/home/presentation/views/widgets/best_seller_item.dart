import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView);
      },
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: Image.asset(
          "assets/images/book_cover.png",
          fit: BoxFit.fill,
          width: 50,
          height: 150,
        ),
        title: Text(
          "Book Title",
          style: TextStyles.textStyle16Bold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Author Name",
              style: TextStyles.textStyle14,
            ),
            Row(
              children: [
                Text(
                  r"500$",
                  style: TextStyles.textStyle14Bold,
                ),
                Spacer(),
                RatingWithNumbers()
              ],
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
