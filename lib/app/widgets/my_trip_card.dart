// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/data/models/my_trip/my_trip_card_model.dart';

class MyTripCard extends StatelessWidget {
  final MyTripCardModel myTrip;
  const MyTripCard({super.key, required this.myTrip});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: AppColor.secondary50,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColor.primary900.withValues(alpha: 0.10),
            blurRadius: 24,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                color: AppColor.appBackground,
                border: Border.all(color: AppColor.appBorder),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            AppSpacing.sbx12,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(myTrip.tripName, style: AppFont.appBold18),
                AppSpacing.sby4,
                Text("| ${myTrip.destinations}", style: AppFont.appRegular12),
                AppSpacing.sby14,
                Text(
                  "${DateFormat('MMM d, yyyy').format(myTrip.startDate)} - ${DateFormat('MMM d, yyyy').format(myTrip.endDate)}",
                  style: AppFont.appRegular14,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
