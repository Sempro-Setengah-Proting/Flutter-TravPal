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

class AppButtonIcon extends StatelessWidget {
  const AppButtonIcon({
    super.key,
    required this.icon,
    this.onPressed,
    this.buttonWidth,
    this.buttonHeight,
  });

  final IconData icon;
  final double? buttonWidth;
  final double? buttonHeight;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      style: ButtonStyle(
        fixedSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? 44, buttonHeight ?? 44),
        ),
        minimumSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? 44, buttonHeight ?? 44),
        ),
        maximumSize: WidgetStatePropertyAll(
          Size(buttonWidth ?? 44, buttonHeight ?? 44),
        ),
        padding: WidgetStatePropertyAll(EdgeInsets.zero),
        shape: WidgetStatePropertyAll(CircleBorder()),
        backgroundColor: WidgetStatePropertyAll(AppColor.appSecondary),
        foregroundColor: WidgetStatePropertyAll(AppColor.appPrimary),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      onPressed: onPressed,
      icon: Icon(icon),
    );
  }
}
