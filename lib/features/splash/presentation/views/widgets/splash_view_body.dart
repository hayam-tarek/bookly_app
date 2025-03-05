import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:bookly_app/core/utils/constant.dart';
import 'package:bookly_app/features/home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    navigateToHomeView();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      spacing: 16,
      children: [
        SizedBox(
          width: double.infinity,
        ),
        DefaultTextStyle(
          style: GoogleFonts.limelight(
            fontSize: MediaQuery.of(context).size.width * 0.20,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              WavyAnimatedText(
                'Bookly',
                speed: const Duration(milliseconds: 300),
              ),
            ],
            isRepeatingAnimation: false,
          ),
        ),
        Text(
          "Read Freely, Anytime, Anywhere!",
        ),
      ],
    );
  }

  void navigateToHomeView() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(HomeView(),
            transition: Transition.rightToLeft,
            duration: viewtransitionDuration);
      });
    });
  }
}
