import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../constants/app_color.dart';
import '../controllers/my_trip_page_controller.dart';

class MyTripPageView extends GetView<MyTripPageController> {
  const MyTripPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [AppColor.appBackground, AppColor.appSecondary],
          stops: [0.0, 0.75],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('My Trip'),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: const Center(
          child: Text(
            'MyTripPageView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
