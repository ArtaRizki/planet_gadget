import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:planet_gadget/library/color.dart';
import 'package:planet_gadget/presentation/pages/member/member_page.dart';

import '../../catalog.dart';
import '../pages/account/account_page.dart';
import '../pages/dashboard/dashboard_page.dart';
import '../../library/bottom_navbar/floating_bottom_navigation_bar.dart';
import '../pages/member/catalog/catalog_page.dart';
import '../pages/wishilist/wishlist_page.dart';

class BottomNavWidget extends StatefulWidget {
  const BottomNavWidget({super.key});

  @override
  State<BottomNavWidget> createState() => _BottomNavWidgetState();
}

class _BottomNavWidgetState extends State<BottomNavWidget> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    late FirebaseMessaging _messaging;
    @override
    void initState() {
      _messaging = FirebaseMessaging.instance;
      log("TOken ${_messaging.getToken()}");
      super.initState();
    }

    return Scaffold(
      extendBody: true,
      body: IndexedStack(
        index: currentIndex,
        children: const [
          DashboardPage(),
          CatalogPage(),
          MemberPage(),
          WishlistPage(),
          AccountPage(),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButtonAnimator: null,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0,
        child: FloatingNavbar(
          itemBorderRadius: 12,
          selectedBackgroundColor: primaryBlue,
          selectedItemColor: white,
          unselectedItemColor: black,
          backgroundColor: white,
          items: [
            FloatingNavbarItem(
                customWidget: SvgPicture.asset(
                    'assets/icons/bottom_navbar/${currentIndex != 0 ? 'home' : 'home_filled'}.svg')),
            FloatingNavbarItem(
                customWidget: SvgPicture.asset(
                    'assets/icons/bottom_navbar/${currentIndex != 1 ? 'catalog' : 'catalog_filled'}.svg')),
            FloatingNavbarItem(
                customWidget: SvgPicture.asset(
                    'assets/icons/bottom_navbar/${currentIndex != 2 ? 'member' : 'member_filled'}.svg')),
            FloatingNavbarItem(
                customWidget: SvgPicture.asset(
                    'assets/icons/bottom_navbar/${currentIndex != 3 ? 'wishlist' : 'wishlist_filled'}.svg')),
            FloatingNavbarItem(
                customWidget: SvgPicture.asset(
                    'assets/icons/bottom_navbar/${currentIndex != 4 ? 'account' : 'account_filled'}.svg')),
          ],
          currentIndex: currentIndex,
          onTap: (selected) {
            setState(() => currentIndex = selected);
          },
        ),
      ),
    );
  }
}
