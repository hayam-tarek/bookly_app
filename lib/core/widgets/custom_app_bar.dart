import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/search/presentation/views/custom_search_delegate.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.logo,
          width: MediaQuery.sizeOf(context).width * 0.25,
        ),
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {
            showSearch(context: context, delegate: CustomSearchDelegate());
          },
        ),
      ],
    );
  }
}
