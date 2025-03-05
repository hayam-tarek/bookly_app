import 'package:bookly_app/core/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const CustomAppBar(),
          BookPannerItem(),
        ],
      ),
    );
  }
}

class BookPannerItem extends StatelessWidget {
  const BookPannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.25,
      width: MediaQuery.sizeOf(context).width * 0.40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
        ),
      ),
    );
  }
}
