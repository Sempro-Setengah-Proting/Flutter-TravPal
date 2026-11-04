import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/data/models/destination/destination_card_model.dart';
import 'package:trav_pal_flutter/app/widgets/app_destination_card.dart';
import 'package:trav_pal_flutter/app/widgets/app_hero_card.dart';
import 'package:trav_pal_flutter/app/widgets/app_hero_destination_card.dart';
import 'package:trav_pal_flutter/app/widgets/app_search_bar.dart';
import 'package:trav_pal_flutter/app/widgets/app_sliver_app_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

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
        body: CustomScrollView(
          slivers: [
            AppSliverAppBar(
              title: 'TravPal',
              actionIconButton: true,
              actionIcon: Icons.notifications,
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AppSpacing.sby16,
                  AppSearchBar(),
                  AppSpacing.sby16,
                  Row(
                    children: [
                      Expanded(
                        child: AppHeroCard(
                          icon: Icons.add,
                          title: 'Plan a trip',
                          subTitle:
                              'Invite friends and plan your trip with them',
                        ),
                      ),
                      AppSpacing.sbx10,
                      Expanded(
                        child: AppHeroCard(
                          icon: Icons.link,
                          title: 'Join a trip',
                          subTitle: 'Join a trip with friends using the code',
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.sby16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Itenerary Inspiration",
                        style: AppFont.appRegular18,
                      ),
                      Text(
                        "See All",
                        style: AppFont.appBold16.copyWith(
                          color: AppColor.appPrimary,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.sby8,
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.only(left: 16),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 200,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: (MediaQuery.sizeOf(context).width - 32),
                        child: const AppHeroDestinationCard(
                          destination: DestinationCardModel(
                            rating: '4.8',
                            location: 'Jogja, DI Yogyakarta',
                            duration: '4 days 3 night',
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (_, _) => AppSpacing.sbx10,
                    itemCount: 5,
                  ),
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AppSpacing.sby16,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Popular Spot", style: AppFont.appRegular18),
                      Text(
                        "See All",
                        style: AppFont.appBold16.copyWith(
                          color: AppColor.appPrimary,
                        ),
                      ),
                    ],
                  ),
                  AppSpacing.sby8,
                  GridView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      childAspectRatio: 175 / 270,
                    ),
                    itemBuilder: (context, index) => const AppDestinationCard(),
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
