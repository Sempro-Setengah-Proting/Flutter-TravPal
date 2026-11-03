import 'package:cupertino_native/cupertino_native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

import '../../explore_page/views/explore_page_view.dart';
import '../../home/views/home_view.dart';
import '../../my_trip_page/views/my_trip_page_view.dart';
import '../../profile_page/views/profile_page_view.dart';
import '../controllers/tab_bar_page_controller.dart';

class TabBarPageView extends GetView<TabBarPageController> {
  const TabBarPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final isCurrentRoute = ModalRoute.isCurrentOf(context) ?? true;

    return Obx(
      () => Scaffold(
        extendBody: true,
        body: IndexedStack(
          index: controller.selectedTab.value,
          children: const [
            HomeView(),
            ExplorePageView(),
            MyTripPageView(),
            ProfilePageView(),
          ],
        ),
        bottomNavigationBar: isCurrentRoute
            ? SafeArea(
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
              )
            : null,
      ),
    );
  }
}
