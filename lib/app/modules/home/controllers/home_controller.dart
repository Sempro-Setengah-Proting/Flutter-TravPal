import 'package:get/get.dart';

class HomeController extends GetxController {
  final selectedTab = 0.obs;

  void selectTab(int index) {
    if (index < 0 || index >= 4) return;
    selectedTab.value = index;
  }
}
