import 'package:bookly_app/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class PricingContainer extends StatelessWidget {
  const PricingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomButton(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              bottomLeft: Radius.circular(20),
            ),
            text: r"500$",
            color: Colors.white,
            textColor: Colors.orangeAccent,
          ),
          CustomButton(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(0),
            ),
            text: "Free Preview",
            color: Colors.orangeAccent,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }
}
