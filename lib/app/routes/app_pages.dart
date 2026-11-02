import 'package:get/get.dart';

import '../modules/explore_page/bindings/explore_page_binding.dart';
import '../modules/explore_page/views/explore_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/my_trip_page/bindings/my_trip_page_binding.dart';
import '../modules/my_trip_page/views/my_trip_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/sign_in_page/bindings/sign_in_page_binding.dart';
import '../modules/sign_in_page/views/sign_in_page_view.dart';
import '../modules/sign_up_page/bindings/sign_up_page_binding.dart';
import '../modules/sign_up_page/views/sign_up_page_view.dart';
import '../modules/splash_screen_page/bindings/splash_screen_page_binding.dart';
import '../modules/splash_screen_page/views/splash_screen_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP_PAGE,
      page: () => const SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN_PAGE,
      page: () => const SplashScreenPageView(),
      binding: SplashScreenPageBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_IN_PAGE,
      page: () => const SignInPageView(),
      binding: SignInPageBinding(),
    ),
    GetPage(
      name: _Paths.EXPLORE_PAGE,
      page: () => const ExplorePageView(),
      binding: ExplorePageBinding(),
    ),
    GetPage(
      name: _Paths.MY_TRIP_PAGE,
      page: () => const MyTripPageView(),
      binding: MyTripPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => const ProfilePageView(),
      binding: ProfilePageBinding(),
    ),
  ];
}
