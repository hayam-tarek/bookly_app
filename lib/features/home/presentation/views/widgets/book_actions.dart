import 'package:bookly_app/core/themes/app_colors.dart';
import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:bookly_app/core/widgets/custom_error_toast.dart';
import 'package:bookly_app/features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
            text: book.saleInfo?.saleability! == 'FOR_SALE'
                ? "${book.saleInfo?.listPrice?.amount.toString()} ${book.saleInfo?.listPrice?.currencyCode.toString()}"
                : "Free",
            color: Colors.white,
            textColor: AppColors.secondaryColor,
            onPressed: () {},
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
                try {
                  _launchUrl(Uri.parse(previewLink));
                } catch (e) {
                  CustomErrorToast.show(context, e.toString());
                }
              }
            },
          ),
        ],
      ),
    );
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await canLaunchUrl(url)) {
    throw Exception('Could not launch $url');
  } else {
    await launchUrl(url);
  }
}
