// ignore_for_file: unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.labelStyle,
    required this.label,
    required this.onPressed,
  });

  final TextStyle labelStyle;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(AppColor.appPrimary),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
        ),
        child: Text(label, style: labelStyle),
      ),
    );
  }
}
