import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
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
                ),
              ],
              isRepeatingAnimation: false,
            ),
          ),
          Text(
            "Read Freely, Anytime, Anywhere!",
          ),
        ],
      ),
    );
  }
}
