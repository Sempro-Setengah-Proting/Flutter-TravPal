import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

import '../controllers/explore_page_controller.dart';

class ExplorePageView extends GetView<ExplorePageController> {
  const ExplorePageView({super.key});
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
          title: const Text(''),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: const Center(
          child: Text(
            'ExplorePageView is working',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
