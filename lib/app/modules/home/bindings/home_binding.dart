import 'package:get/get.dart';

import '../../explore_page/bindings/explore_page_binding.dart';
import '../../my_trip_page/bindings/my_trip_page_binding.dart';
import '../../profile_page/bindings/profile_page_binding.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    ExplorePageBinding().dependencies();
    MyTripPageBinding().dependencies();
    ProfilePageBinding().dependencies();
  }
}
