import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/styles/custom_text_styles.dart';

class BottomNavigationIcon extends StatelessWidget {
  final IconData? icon;
  final String title;
  final bool isActive;

  const BottomNavigationIcon({
    super.key,
    required this.icon,
    required this.title,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: isActive ? Colors.black : Colors.grey.shade600),
        Text(
          title,
          style: isActive
              ? CustomTextStyles.of(context).semiBold14.apply(color: Colors.black)
              : CustomTextStyles.of(context).regular14.apply(color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
