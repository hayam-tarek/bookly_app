import 'package:bookly_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

import 'book_banners_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CustomAppBar(),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.25,
            child: BookBannersView(),
          ),
        ],
      ),
    );
  }
}
