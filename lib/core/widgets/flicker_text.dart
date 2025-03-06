import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class FlickerText extends StatelessWidget {
  const FlickerText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: DefaultTextStyle(
        style: const TextStyle(
          fontSize: 20,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          color: Colors.white,
          shadows: [
            Shadow(
              blurRadius: 7.0,
              color: Colors.white,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: AnimatedTextKit(
          animatedTexts: [
            FlickerAnimatedText('Best Sellers'),
          ],
        ),
      ),
    );
  }
}
