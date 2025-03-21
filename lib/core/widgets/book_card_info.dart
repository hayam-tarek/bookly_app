import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/functions/get_cost_of_book.dart';
import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/features/home/presentation/views/widgets/rating.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookCardInfo extends StatelessWidget {
  const BookCardInfo({super.key, required this.book});
  final BookModel book;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.bookDetailsView, extra: book);
      },
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        leading: CachedNetworkImage(
          errorWidget: (context, url, error) => const Icon(Icons.error),
          imageUrl: book.volumeInfo!.imageLinks?.thumbnail ?? '',
          fit: BoxFit.fill,
          width: 50,
          height: 100,
        ),
        title: Text(
          book.volumeInfo!.title!,
          style: TextStyles.textStyle16Bold,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${book.volumeInfo!.authors?.first}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyle14,
            ),
            Row(
              children: [
                Text(
                  getCostOfBook(book),
                  style: TextStyles.textStyle14Bold,
                ),
                Spacer(),
                RatingWithNumbers(
                  rating: book.volumeInfo!.averageRating ?? 0.0,
                  totalRatings: book.volumeInfo!.ratingsCount ?? 0,
                ),
                // Icon(
                //   Icons.money_off,
                //   color: Colors.lightGreen,
                // ),
                // Text(
                //   ' (${book.volumeInfo!.pageCount} pages)',
                //   style: TextStyles.textStyle14Bold,
                // )
              ],
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
