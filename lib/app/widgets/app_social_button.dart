// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

class AppSocialButton extends StatelessWidget {
  const AppSocialButton({
    super.key,
    required this.label,
    required this.labelStyle,
    required this.logoName,
    this.logoWidth,
    this.logoHeight,
  });

  final String label;
  final TextStyle labelStyle;
  final String logoName;
  final double? logoWidth;
  final double? logoHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColor.secondary950.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: TextButton.icon(
          onPressed: () {},
          style: TextButton.styleFrom(backgroundColor: AppColor.secondary50),
          icon: SvgPicture.asset(
            'assets/logos/$logoName',
            width: logoWidth ?? 22,
            height: logoHeight ?? 22,
          ),
          label: Text(label, style: labelStyle),
        ),
      ),
    );
  }
}
