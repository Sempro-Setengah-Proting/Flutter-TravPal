import 'package:get/get.dart';

import '../../explore_page/bindings/explore_page_binding.dart';
import '../../home/bindings/home_binding.dart';
import '../../my_trip_page/bindings/my_trip_page_binding.dart';
import '../../profile_page/bindings/profile_page_binding.dart';
import '../controllers/tab_bar_page_controller.dart';

class TabBarPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TabBarPageController>(() => TabBarPageController());
    HomeBinding().dependencies();
    ExplorePageBinding().dependencies();
    MyTripPageBinding().dependencies();
    ProfilePageBinding().dependencies();
  }
}
