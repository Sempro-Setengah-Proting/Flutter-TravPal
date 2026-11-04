import 'package:flutter/cupertino.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

class AppHeroCard extends StatelessWidget {
  const AppHeroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColor.appSecondary100,
      ),
    );
  }
}
