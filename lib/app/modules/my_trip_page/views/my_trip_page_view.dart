import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/data/models/my_trip/my_trip_card_model.dart';
import 'package:trav_pal_flutter/app/widgets/app_search_bar.dart';
import 'package:trav_pal_flutter/app/widgets/my_trip_card.dart';

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
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  AppSearchBar(hintText: 'Search trips'),
                  AppSpacing.sby16,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                  MyTripCard(
                    myTrip: MyTripCardModel(
                      tripName: 'Liburan Bali',
                      destinations: ['Ubud', 'Kuta'],
                      startDate: DateTime(2026, 12, 10),
                      endDate: DateTime(2026, 12, 15),
                      imagePath: "test",
                    ),
                  ),
                  AppSpacing.sby12,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
