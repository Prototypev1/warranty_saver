import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:warranty_saver/core/presentation/common/widgets/bottom_navigation/bottom_navigation_tab.dart';
import 'package:warranty_saver/feature/add_page.dart/presentation/add_page.dart';
import 'package:warranty_saver/feature/donations_page.dart/presentation/donations_page.dart';
import 'package:warranty_saver/feature/home_page/presentation/home_page.dart';
import 'package:warranty_saver/feature/profile_page/presentation/profile_page.dart';
import 'package:warranty_saver/feature/warranties_page/presentation/warranties_page.dart';
import 'package:warranty_saver/gen/locale_keys.g.dart';

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
            text: LocaleKeys.bottom_bar_home.tr(),
            onPressed: () {
              onPageChanged(0);
              context.pushNamed(HomePage.pageName);
            },
            isActive: page == 0,
          ),
          BottomNavigationTab(
            icon: Icons.list,
            text: LocaleKeys.bottom_bar_warranties.tr(),
            onPressed: () {
              onPageChanged(1);
              context.pushNamed(WarrantiesPage.pageName);
            },
            isActive: page == 1,
          ),
          BottomNavigationTab(
            icon: Icons.camera_alt,
            text: LocaleKeys.bottom_bar_add.tr(),
            onPressed: () {
              onPageChanged(2);
              context.pushNamed(AddPage.pageName);
            },
            isActive: page == 2,
          ),
          BottomNavigationTab(
            icon: Icons.account_circle,
            text: LocaleKeys.bottom_bar_profile.tr(),
            onPressed: () {
              onPageChanged(3);
              context.pushNamed(ProfilePage.pageName);
            },
            isActive: page == 3,
          ),
          BottomNavigationTab(
            icon: Icons.volunteer_activism,
            text: LocaleKeys.bottom_bar_donate.tr(),
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
