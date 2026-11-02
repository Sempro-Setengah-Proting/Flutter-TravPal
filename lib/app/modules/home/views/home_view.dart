import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

import '../../explore_page/views/explore_page_view.dart';
import '../../my_trip_page/views/my_trip_page_view.dart';
import '../../profile_page/views/profile_page_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.selectedTab.value,
          children: const [
            _HomeTab(),
            ExplorePageView(),
            MyTripPageView(),
            ProfilePageView(),
          ],
        ),
        bottomNavigationBar: SafeArea(
          top: false,
          bottom: false,
          minimum: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: Align(
            alignment: Alignment.bottomCenter,
            heightFactor: 1,
            child: CNTabBar(
              backgroundColor: AppColor.appPrimary,
              tint: AppColor.appPrimary,
              items: const [
                CNTabBarItem(label: 'Home', icon: CNSymbol('house.fill')),
                CNTabBarItem(label: 'Explore', icon: CNSymbol('safari')),
                CNTabBarItem(label: 'My Trip', icon: CNSymbol('map')),
                CNTabBarItem(
                  label: 'Profile',
                  icon: CNSymbol('person.crop.circle'),
                ),
              ],
              currentIndex: controller.selectedTab.value,
              onTap: controller.selectTab,
            ),
          ),
        ),
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home'), centerTitle: true),
      body: const Center(child: Text('Home')),
    );
  }
}
