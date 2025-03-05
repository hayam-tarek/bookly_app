import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(AppAssets.logo, width: 100),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        ),
      ],
    );
  }
}
