import 'package:flutter/cupertino.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

class AppHeroDestinationCard extends StatelessWidget {
  const AppHeroDestinationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColor.secondary100,
      ),
    );
  }
}
