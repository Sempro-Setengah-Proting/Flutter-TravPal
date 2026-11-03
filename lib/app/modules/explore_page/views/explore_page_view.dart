import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/widgets/app_bottom_sheet.dart';
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
                      AppButtonIcon(
                        onPressed: () {
                          AppBottomSheet.show<void>(
                            coverPercentage: 0.7,
                            context: context,
                            title: "Filter",
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Place Category',
                                          style: AppFont.appBold16.copyWith(
                                            color: AppColor.appTextSecondary,
                                          ),
                                        ),
                                        AppSpacing.sby8,
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            for (final category in const [
                                              'Nature',
                                              'Food & Drink',
                                              'Shopping',
                                              'Attractions',
                                              'Hotel',
                                              'Hostel',
                                              'Villa',
                                            ])
                                              _buildFilterOption(category),
                                          ],
                                        ),
                                        AppSpacing.sby24,
                                        Text(
                                          'Rating',
                                          style: AppFont.appBold16.copyWith(
                                            color: AppColor.appTextSecondary,
                                          ),
                                        ),
                                        AppSpacing.sby8,
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            for (final rating in const [
                                              '5',
                                              '≥4',
                                              '≥3',
                                              '≥2',
                                              '≥1',
                                            ])
                                              _buildFilterOption('$rating ☆'),
                                          ],
                                        ),
                                        AppSpacing.sby24,
                                        Text(
                                          'Suitable For',
                                          style: AppFont.appBold16.copyWith(
                                            color: AppColor.appTextSecondary,
                                          ),
                                        ),
                                        AppSpacing.sby8,
                                        Wrap(
                                          spacing: 8,
                                          runSpacing: 8,
                                          children: [
                                            for (final audience in const [
                                              'Family',
                                              'Couple',
                                              'Group',
                                              'Solo',
                                            ])
                                              _buildFilterOption(audience),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        icon: Icons.tune_rounded,
                      ),
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

  Widget _buildFilterOption(String label) {
    return AppButton(
      label: label,
      labelStyle: AppFont.appRegular12.copyWith(color: Colors.white),
      shrinkWrap: true,
      onPressed: () {},
    );
  }
}
