import 'dart:ui';

import 'package:flutter/material.dart';

import '../constants/app_font.dart';
import 'app_button.dart';

class AppSliverAppBar extends StatelessWidget {
  const AppSliverAppBar({
    super.key,
    required this.title,
    this.actionIconButton = false,
    this.actionIcon,
    this.onActionPressed,
    this.leadingIconButton = false,
    this.leadingIcon,
    this.onLeadingPressed,
  }) : assert(
         !actionIconButton || actionIcon != null,
         'actionIcon is required when actionIconButton is true.',
       ),
       assert(
         !leadingIconButton || leadingIcon != null,
         'leadingIcon is required when leadingIconButton is true.',
       );

  final String title;
  final bool actionIconButton;
  final IconData? actionIcon;
  final VoidCallback? onActionPressed;
  final bool leadingIconButton;
  final IconData? leadingIcon;
  final VoidCallback? onLeadingPressed;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 44,
      pinned: true,
      centerTitle: true,
      automaticallyImplyLeading: false,
      automaticallyImplyActions: false,
      leadingWidth: leadingIconButton ? 60 : null,
      leading: leadingIconButton
          ? Padding(
              padding: const EdgeInsets.only(left: 16),
              child: AppButtonIcon(
                icon: leadingIcon!,
                onPressed: onLeadingPressed,
              ),
            )
          : null,
      title: Text(title, style: AppFont.appBold16),
      actions: actionIconButton
          ? [AppButtonIcon(icon: actionIcon!, onPressed: onActionPressed)]
          : null,
      actionsPadding: actionIconButton
          ? const EdgeInsets.only(right: 16)
          : EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      forceMaterialTransparency: true,
      scrolledUnderElevation: 0,
      elevation: 0,
      flexibleSpace: Builder(
        builder: (context) {
          final settings = context
              .dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>();
          final isScrolledUnder = settings?.isScrolledUnder ?? false;

          return ClipRect(
            child: TweenAnimationBuilder<double>(
              tween: Tween(begin: 0, end: isScrolledUnder ? 5 : 0),
              duration: MediaQuery.disableAnimationsOf(context)
                  ? Duration.zero
                  : const Duration(milliseconds: 160),
              builder: (context, sigma, child) => BackdropFilter(
                enabled: sigma > 0,
                filter: ImageFilter.blur(sigmaX: sigma, sigmaY: sigma),
                child: child,
              ),
              child: const SizedBox.expand(),
            ),
          );
        },
      ),
    );
  }
}
