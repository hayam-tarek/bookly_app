import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'best_seller_item.dart';
import 'book_banners_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomAppBar(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: BookBannersView(),
          ),
          const SizedBox(height: 16),
          Text(
            "Best sellers",
            style: TextStyles.textStyle20Bold,
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) => const BestSellerItem(),
            ),
          ),
        ],
      ),
    );
  }
}
