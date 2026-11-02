import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_trip_page_controller.dart';

class MyTripPageView extends GetView<MyTripPageController> {
  const MyTripPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTripPageView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyTripPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
