import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CustomLoadingWidget extends StatelessWidget {
  const CustomLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        AppAssets.bookAnimation,
        width: MediaQuery.sizeOf(context).width / 3.5,
        height: MediaQuery.sizeOf(context).height / 6,
        fit: BoxFit.scaleDown,
      ),
    );
    // return CircularProgressIndicator(
    //   color: AppColors.secondaryColor,
    // );
  }
}
