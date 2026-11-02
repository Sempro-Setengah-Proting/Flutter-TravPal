import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/app_color.dart';
import '../../../constants/app_font.dart';

class SplashLogoReveal extends StatefulWidget {
  const SplashLogoReveal({
    super.key,
    required this.composition,
    required this.onReady,
    required this.onCompleted,
  });

  final LottieComposition? composition;
  final VoidCallback onReady;
  final VoidCallback onCompleted;

  @override
  State<SplashLogoReveal> createState() => _SplashLogoRevealState();
}

class _SplashLogoRevealState extends State<SplashLogoReveal>
    with SingleTickerProviderStateMixin {
  static const _fadeDuration = Duration(milliseconds: 150);

  late final AnimationController _animation;
  bool _started = false;
  bool _reduceMotion = false;

  @override
  void initState() {
    super.initState();
    _animation =
        AnimationController(
          vsync: this,
          duration: widget.composition?.duration ?? _fadeDuration,
        )..addStatusListener((status) {
          if (status == AnimationStatus.completed) widget.onCompleted();
        });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _reduceMotion = MediaQuery.disableAnimationsOf(context);

    if (!_started) {
      _started = true;
      if (_reduceMotion) _animation.duration = _fadeDuration;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        widget.onReady();
        _animation.forward();
      });
    } else if (_reduceMotion && _animation.isAnimating) {
      _animation.animateTo(1, duration: _fadeDuration);
    }
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final composition = widget.composition;

    return Positioned.fill(
      child: AbsorbPointer(
        child: RepaintBoundary(
          child: _reduceMotion || composition == null
              ? FadeTransition(
                  opacity: ReverseAnimation(_animation),
                  child: const SplashLogoFrame(showTitle: true),
                )
              : Lottie(
                  composition: composition,
                  controller: _animation,
                  repeat: false,
                  frameRate: FrameRate.max,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}

class SplashLogoFrame extends StatelessWidget {
  const SplashLogoFrame({super.key, this.showTitle = false});

  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColor.appPrimary,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final scale = math.max(
            constraints.maxWidth / 390,
            constraints.maxHeight / 844,
          );

          return Stack(
            fit: StackFit.expand,
            children: [
              Center(
                child: SvgPicture.asset(
                  'assets/logos/travpal_logo.svg',
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                  width: 120 * scale,
                  height: 120 * 58 / 102 * scale,
                ),
              ),
              if (showTitle)
                Positioned(
                  top: constraints.maxHeight / 2 + 52 * scale,
                  left: 0,
                  right: 0,
                  child: Text(
                    'TravPal',
                    textAlign: TextAlign.center,
                    style: AppFont.appBold32.copyWith(
                      color: Colors.white,
                      fontSize: 32 * scale,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
