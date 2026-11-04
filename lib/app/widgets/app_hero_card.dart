import 'package:flutter/material.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/widgets/app_button.dart';

class AppHeroCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  const AppHeroCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.appSecondary100,
      ),
      child: Padding(
        padding: EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppButtonIcon(icon: icon),
            AppSpacing.sby8,
            Text(title, style: AppFont.appBold20),
            AppSpacing.sby8,
            Text(subTitle, style: AppFont.appRegular12.copyWith(height: 1.2)),
          ],
        ),
      ),
    );
  }
}
