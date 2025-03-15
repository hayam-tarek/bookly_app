import 'package:bookly_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.borderRadius,
    required this.text,
    required this.color,
    required this.textColor,
    required this.onPressed,
  });
  final BorderRadiusGeometry borderRadius;
  final String text;
  final Color color;
  final Color textColor;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(vertical: 12),
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: borderRadius,
            ),
          ),
          backgroundColor: WidgetStatePropertyAll(color),
        ),
        child: Text(
          text,
          style: TextStyles.textStyle16Bold.copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
