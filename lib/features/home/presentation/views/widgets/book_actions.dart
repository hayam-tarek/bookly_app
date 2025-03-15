import 'package:bookly_app/core/themes/app_colors.dart';
import 'package:bookly_app/core/utils/functions/get_cost_of_book.dart';
import 'package:bookly_app/core/utils/functions/lunch_url.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/widgets/custom_error_toast.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BookActions extends StatelessWidget {
  const BookActions({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(0),
            ),
            text: getCostOfBook(book),
            color: Colors.white,
            textColor: AppColors.secondaryColor,
            onPressed: null,
          ),
          CustomButton(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(0),
            ),
            text: "Preview",
            color: AppColors.secondaryColor,
            textColor: Colors.white,
            onPressed: () {
              final previewLink = book.volumeInfo?.previewLink;
              if (previewLink != null) {
                launchThisUrl(Uri.parse(previewLink), context);
              } else {
                CustomErrorToast.show(context, 'No preview available');
              }
            },
          ),
        ],
      ),
    );
  }
}
