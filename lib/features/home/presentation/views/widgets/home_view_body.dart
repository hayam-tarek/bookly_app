import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:bookly_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'best_seller_item.dart';
import 'book_banners_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        controller: scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: const CustomAppBar(),
          ),
          SliverToBoxAdapter(
            child: BookBannersView(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Newest Books",
                style: TextStyles.textStyle20Bold,
              ),
            ),
          ),
          BestSellerView()
        ],
      ),
    );
  }
}

class BestSellerView extends StatelessWidget {
  const BestSellerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const BestSellerItem(),
    );
  }
}
