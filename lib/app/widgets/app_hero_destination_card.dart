import 'package:flutter/material.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/data/models/destination/destination_card_model.dart';
import 'package:trav_pal_flutter/app/widgets/app_button.dart';

class AppHeroDestinationCard extends StatelessWidget {
  const AppHeroDestinationCard({super.key, required this.destination});

  final DestinationCardModel destination;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.secondary100,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset('assets/images/candi_image.png', fit: BoxFit.cover),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      AppColor.neutral950.withValues(alpha: 0.85),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 32, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today_outlined,
                            color: AppColor.neutral100,
                            size: 18,
                          ),
                          AppSpacing.sbx4,
                          Expanded(
                            child: Text(
                              destination.duration,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: AppFont.appRegular16.copyWith(
                                color: AppColor.neutral100,
                              ),
                            ),
                          ),
                        ],
                      ),
                      AppSpacing.sby4,
                      Text(
                        destination.location,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppFont.appBold22.copyWith(
                          color: AppColor.neutral100,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
                      destination.rating,
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
    );
  }
}
