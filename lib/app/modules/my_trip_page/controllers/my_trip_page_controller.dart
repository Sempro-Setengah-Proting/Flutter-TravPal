import 'package:get/get.dart';

class MyTripPageController extends GetxController {
  final destinationCount = 1.obs;

  void addDestination() {
    destinationCount.value++;
  }

  void resetDestinations() {
    destinationCount.value = 1;
  }
}
