import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/widgets/bottom_navigation/bottom_navigation_tab.dart';
import 'package:warranty_saver/feature/add_page.dart/presentation/add_page.dart';
import 'package:warranty_saver/feature/donations_page.dart/presentation/donations_page.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/profile_page/presentation/profile_page.dart';
import 'package:warranty_saver/feature/warranties_page/presentation/warranties_page.dart';

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
      height: 64,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          BottomNavigationTab(
            icon: Icons.home,
            text: 'Home',
            onPressed: () {
              onPageChanged(0);
              context.pushNamed(HomePage.pageName);
            },
            isActive: page == 0,
          ),
          BottomNavigationTab(
            icon: Icons.list,
            text: 'Warranties',
            onPressed: () {
              onPageChanged(1);
              context.pushNamed(WarrantiesPage.pageName);
            },
            isActive: page == 1,
          ),
          BottomNavigationTab(
            icon: Icons.camera_alt,
            text: 'Add',
            onPressed: () {
              onPageChanged(2);
              context.pushNamed(AddPage.pageName);
            },
            isActive: page == 2,
          ),
          BottomNavigationTab(
            icon: Icons.account_circle,
            text: 'Profile',
            onPressed: () {
              onPageChanged(3);
              context.pushNamed(ProfilePage.pageName);
            },
            isActive: page == 3,
          ),
          BottomNavigationTab(
            icon: Icons.volunteer_activism,
            text: 'Donate',
            onPressed: () {
              onPageChanged(4);
              context.pushNamed(DonationsPage.pageName);
            },
            isActive: page == 4,
          ),
        ],
      ),
    );
  }
}
