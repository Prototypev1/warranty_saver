import 'package:flutter/material.dart';
import 'package:warranty_saver/core/presentation/common/widgets/bottom_navigation/bottom_navigation_tab.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int page;
  final void Function(int page) onPageChanged;

  const CustomBottomNavigation({
    super.key,
    required this.page,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.black, width: 1),
        ),
      ),
      height: 56,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          BottomNavigationTab(
            icon: Icons.home,
            text: 'Home',
            onPressed: () => onPageChanged(0),
            isActive: page == 0,
          ),
          BottomNavigationTab(
            icon: Icons.camera_alt,
            text: 'Add',
            onPressed: () => onPageChanged(1),
            isActive: page == 1,
          ),
          BottomNavigationTab(
            icon: Icons.import_export,
            text: 'Import',
            onPressed: () => onPageChanged(2),
            isActive: page == 2,
          ),
          BottomNavigationTab(
            icon: Icons.account_circle,
            text: 'Profile',
            onPressed: () => onPageChanged(3),
            isActive: page == 3,
          ),
          BottomNavigationTab(
            icon: Icons.card_giftcard,
            text: 'Donate',
            onPressed: () => onPageChanged(4),
            isActive: page == 4,
          ),
        ],
      ),
    );
  }
}
