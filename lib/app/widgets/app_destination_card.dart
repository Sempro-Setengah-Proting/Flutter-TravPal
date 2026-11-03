import 'package:flutter/material.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/widgets/app_button.dart';

class AppDestinationCard extends StatelessWidget {
  const AppDestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 175,
      height: 270,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColor.appSecondary100,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            child: SizedBox(
              height: 170,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    'assets/images/pantai_image.png',
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 8,
                    left: 8,
                    child: Container(
                      height: 36,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: const ShapeDecoration(
                        color: AppColor.appSecondary,
                        shape: StadiumBorder(),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            color: AppColor.appWarning,
                            size: 18,
                          ),
                          AppSpacing.sbx4,
                          Text(
                            '4.8',
                            style: AppFont.appRegular14.copyWith(
                              color: AppColor.appPrimary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Semantics(
                      label: 'Add to favorites',
                      child: AppButtonIcon(
                        buttonHeight: 36,
                        buttonWidth: 36,
                        icon: Icons.favorite_border,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 175,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pantai Pandawa", style: AppFont.appRegular16),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: AppColor.appPrimary,
                        size: 16,
                      ),
                      AppSpacing.sbx4,
                      Text("Bali", style: AppFont.appRegular14),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
