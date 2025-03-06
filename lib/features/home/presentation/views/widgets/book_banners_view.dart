import 'package:flutter/material.dart';

import 'book_banner_item.dart';

class BookBannersView extends StatelessWidget {
  BookBannersView({super.key});
  final CarouselController _carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * 0.25,
      child: CarouselView(
        controller: _carouselController,
        itemExtent: MediaQuery.sizeOf(context).width * 0.40,
        children: List.generate(
          10,
          (index) => BookBannerItem(),
        ),
      ),
    );
  }
}
