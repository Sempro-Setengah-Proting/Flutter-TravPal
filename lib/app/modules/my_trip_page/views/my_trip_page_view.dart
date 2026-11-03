import 'package:cupertino_native/cupertino_native.dart';
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
        body: SafeArea(
          top: false,
          bottom: false,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: const Text('My Trip'),
                centerTitle: true,
                automaticallyImplyLeading: false,
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                scrolledUnderElevation: 0,
                elevation: 0,
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: IconButton.filled(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(
                          AppColor.appSecondary,
                        ),
                        foregroundColor: WidgetStatePropertyAll(
                          AppColor.appPrimary,
                        ),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    AppSpacing.sby16,
                    AppSearchBar(hintText: 'Search trips'),
                    AppSpacing.sby16,
                    ...List.generate(
                      10,
                      (_) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: MyTripCard(
                          myTrip: MyTripCardModel(
                            tripName: 'Liburan Bali',
                            destinations: ['Ubud', 'Kuta'],
                            startDate: DateTime(2026, 12, 10),
                            endDate: DateTime(2026, 12, 15),
                            imagePath: "test",
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
