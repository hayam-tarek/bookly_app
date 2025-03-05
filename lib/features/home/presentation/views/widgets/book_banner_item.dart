import 'package:flutter/material.dart';

class BookBannerItem extends StatelessWidget {
  const BookBannerItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.sizeOf(context).height * 0.25,
      // width: MediaQuery.sizeOf(context).width * 0.40,
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
