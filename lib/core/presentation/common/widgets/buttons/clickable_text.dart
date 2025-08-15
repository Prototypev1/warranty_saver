import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';

class ClickableText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ClickableText({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: CustomTextStyles.of(context).bold14.apply(color: Colors.black),
      ),
    );
  }
}
