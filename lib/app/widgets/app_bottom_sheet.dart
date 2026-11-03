import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/app_color.dart';
import '../constants/app_font.dart';

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.title,
    required this.child,
    this.cancelText = 'Cancel',
    this.saveText = 'Save',
    this.coverPercentage = 0.86,
    this.onCancel,
    this.onSave,
  }) : assert(coverPercentage > 0 && coverPercentage <= 1);

  final String title;
  final Widget child;
  final String cancelText;
  final String saveText;
  final double coverPercentage;
  final VoidCallback? onCancel;
  final VoidCallback? onSave;

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required Widget child,
    String cancelText = 'Cancel',
    String saveText = 'Save',
    double coverPercentage = 0.86,
    VoidCallback? onCancel,
    VoidCallback? onSave,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      useRootNavigator: true,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      barrierColor: AppColor.neutral950.withValues(alpha: 0.18),
      elevation: 0,
      showDragHandle: false,
      builder: (sheetContext) => AppBottomSheet(
        title: title,
        cancelText: cancelText,
        saveText: saveText,
        coverPercentage: coverPercentage,
        onCancel: onCancel,
        onSave: onSave,
        child: child,
      ),
    );
  }

  static const double _sheetInset = 8;

  Radius _insetCorner(Radius corner) => Radius.elliptical(
    math.max(0.0, corner.x - _sheetInset),
    math.max(0.0, corner.y - _sheetInset),
  );

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screen = MediaQueryData.fromView(View.of(context));
    final estimatedScreenRadius =
        Theme.of(context).platform == TargetPlatform.iOS
        ? math
              .max(
                screen.viewPadding.top,
                math.max(screen.viewPadding.left, screen.viewPadding.right),
              )
              .clamp(40.0, 62.0)
              .toDouble()
        : 32.0;
    final screenCorners =
        screen.displayCornerRadii ??
        BorderRadius.circular(estimatedScreenRadius);
    final keyboardVisible = mediaQuery.viewInsets.bottom > 0;
    final borderRadius = BorderRadius.only(
      topLeft: const Radius.circular(32),
      topRight: const Radius.circular(32),
      bottomLeft: keyboardVisible
          ? const Radius.circular(32)
          : _insetCorner(screenCorners.bottomLeft),
      bottomRight: keyboardVisible
          ? const Radius.circular(32)
          : _insetCorner(screenCorners.bottomRight),
    );

    return Padding(
      padding: EdgeInsets.fromLTRB(
        _sheetInset,
        0,
        _sheetInset,
        _sheetInset + mediaQuery.viewInsets.bottom,
      ),
      child: SizedBox(
        height: mediaQuery.size.height * coverPercentage,
        child: ClipRSuperellipse(
          borderRadius: borderRadius,
          child: DecoratedBox(
            decoration: ShapeDecoration(
              shape: RoundedSuperellipseBorder(
                borderRadius: borderRadius,
                side: BorderSide(
                  color: AppColor.secondary50.withValues(alpha: 0.7),
                ),
              ),
              color: AppColor.secondary50,
            ),
            child: Material(
              type: MaterialType.transparency,
              child: SafeArea(
                top: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 64,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          children: [
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed:
                                      onCancel ??
                                      () => Navigator.of(context).pop(),
                                  child: Text(
                                    cancelText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFont.appRegular16.copyWith(
                                      color: AppColor.appTextPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                title,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: AppFont.appBold16,
                              ),
                            ),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: onSave,
                                  child: Text(
                                    saveText,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: AppFont.appRegular16.copyWith(
                                      color: onSave == null
                                          ? AppColor.primary300
                                          : AppColor.appPrimary,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
                        child: child,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
