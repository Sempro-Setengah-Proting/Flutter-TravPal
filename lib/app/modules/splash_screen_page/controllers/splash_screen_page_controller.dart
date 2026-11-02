import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:trav_pal_flutter/app/modules/sign_in_page/bindings/sign_in_page_binding.dart';
import 'package:trav_pal_flutter/app/modules/sign_in_page/views/sign_in_page_view.dart';

import '../../../routes/app_pages.dart';
import '../widgets/splash_logo_reveal.dart';

class SplashScreenPageController extends GetxController {
  OverlayEntry? _splashOverlay;
  bool _navigationStarted = false;

  @override
  void onReady() {
    super.onReady();
    _showReveal();
  }

  Future<void> _showReveal() async {
    LottieComposition? composition;
    try {
      composition = await AssetLottie('assets/animations/travpal_splash.json')
          .load();
    } catch (error) {
      debugPrint('Could not load the TravPal splash animation: $error');
    }

    if (isClosed) return;

    final overlay = Get.key.currentState?.overlay;
    if (overlay == null) {
      _openSignIn();
      return;
    }

    _splashOverlay = OverlayEntry(
      builder: (_) => SplashLogoReveal(
        composition: composition,
        onReady: _openSignIn,
        onCompleted: _removeOverlay,
      ),
    );
    overlay.insert(_splashOverlay!);
  }

  void _openSignIn() {
    if (_navigationStarted || isClosed) return;
    _navigationStarted = true;
    Get.offAll<void>(
      () => const SignInPageView(),
      binding: SignInPageBinding(),
      routeName: Routes.SIGN_IN_PAGE,
      transition: Transition.noTransition,
      duration: Duration.zero,
    );
  }

  void _removeOverlay() {
    final overlay = _splashOverlay;
    _splashOverlay = null;
    overlay?.remove();
    overlay?.dispose();
  }

  @override
  void onClose() {
    if (!_navigationStarted) _removeOverlay();
    super.onClose();
  }
}
