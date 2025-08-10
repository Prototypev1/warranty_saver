import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/widgets/bottom_navigation/bottom_navigation_icon.dart';

class BottomNavigationTab extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isActive;
  final IconData? icon;

  const BottomNavigationTab({
    super.key,
    required this.text,
    required this.onPressed,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: 30,
          maxHeight: 44,
          minWidth: MediaQuery.of(context).size.width / 6,
          maxWidth: MediaQuery.of(context).size.width / 5,
        ),
        child: Center(
          child: BottomNavigationIcon(icon: icon, title: text, isActive: isActive),
        ),
      ),
    );
  }
}
