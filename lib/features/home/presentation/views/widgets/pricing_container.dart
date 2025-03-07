import 'package:bookly_app/core/utils/text_styles.dart';
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
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              child: Text(
                r"500$",
                style: TextStyles.textStyle16Bold.copyWith(
                  color: Colors.orangeAccent,
                ),
              ),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {},
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(Colors.orange),
              ),
              child: Text(
                "Free Preview",
                style: TextStyles.textStyle16Bold.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
