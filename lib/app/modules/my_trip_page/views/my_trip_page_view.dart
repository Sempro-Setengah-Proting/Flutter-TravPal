import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/data/models/my_trip/my_trip_card_model.dart';
import 'package:trav_pal_flutter/app/widgets/app_bottom_sheet.dart';
import 'package:trav_pal_flutter/app/widgets/app_search_bar.dart';
import 'package:trav_pal_flutter/app/widgets/app_sliver_app_bar.dart';
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
        body: CustomScrollView(
          slivers: [
            AppSliverAppBar(
              title: 'My Trip',
              actionIconButton: true,
              actionIcon: Icons.add,
              onActionPressed: () {
                AppBottomSheet.show<void>(
                  context: context,
                  title: 'Add Trip',
                  child: const SizedBox.expand(),
                );
              },
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
    );
  }
}
