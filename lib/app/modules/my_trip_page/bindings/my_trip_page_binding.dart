import 'package:get/get.dart';

import '../controllers/my_trip_page_controller.dart';

class MyTripPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyTripPageController>(
      () => MyTripPageController(),
    );
  }
}
