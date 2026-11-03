import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/widgets/app_button.dart';
import 'package:trav_pal_flutter/app/widgets/app_destination_card.dart';
import 'package:trav_pal_flutter/app/widgets/app_search_bar.dart';
import 'package:trav_pal_flutter/app/widgets/app_sliver_app_bar.dart';

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
        body: CustomScrollView(
          slivers: [
            AppSliverAppBar(title: 'Explore'),
            SliverPadding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  AppSpacing.sby16,
                  Row(
                    children: [
                      const Expanded(child: AppSearchBar()),
                      AppSpacing.sbx12,
                      AppButtonIcon(onPressed: () {}, icon: Icons.tune_rounded),
                    ],
                  ),
                  AppSpacing.sby16,
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
