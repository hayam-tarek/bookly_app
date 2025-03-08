import 'package:flutter/material.dart';

class BookBannerItem extends StatelessWidget {
  const BookBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2 / 3,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage("https://picsum.photos/seed/picsum/200/300"),
          ),
        ),
      ),
    );
  }
}
