import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/features/home/presentation/views/book_details_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BestSellerItem extends StatelessWidget {
  const BestSellerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(BookDetailsView());
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
            )
          ],
        ),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
