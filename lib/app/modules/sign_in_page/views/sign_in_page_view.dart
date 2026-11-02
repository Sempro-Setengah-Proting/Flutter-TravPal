import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';
import 'package:trav_pal_flutter/app/routes/app_pages.dart';
import 'package:trav_pal_flutter/app/widgets/app_button.dart';
import 'package:trav_pal_flutter/app/widgets/app_social_button.dart';
import 'package:trav_pal_flutter/app/widgets/app_text_field.dart';

import '../controllers/sign_in_page_controller.dart';

class SignInPageView extends GetView<SignInPageController> {
  const SignInPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSpacing.sby40,
              AppSpacing.sby40,
              SvgPicture.asset(
                'assets/logos/travpal_logo.svg',
                width: 102,
                height: 58,
              ),
              Text("TravPal", style: AppFont.appBold32),
              Text(
                "Welcome back to TravPal, please log in.",
                style: AppFont.appRegular14,
              ),
              AppSpacing.sby40,
              AppSpacing.sby24,
              const AppTextField(label: 'Name'),
              AppSpacing.sby12,
              const AppTextField(
                label: 'Email',
                hintText: 'you@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              AppSpacing.sby40,
              AppButton(
                labelStyle: AppFont.appSemiBold18.copyWith(
                  color: AppColor.appBackground,
                ),
                label: "Log In",
              ),
              AppSpacing.sby24,
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppColor.appBorder, thickness: 1),
                  ),
                  AppSpacing.sbx12,
                  Text(
                    'Or log in with',
                    style: AppFont.appRegular12.copyWith(
                      color: AppColor.appTextSecondary,
                    ),
                  ),
                  AppSpacing.sbx12,
                  const Expanded(
                    child: Divider(color: AppColor.appBorder, thickness: 1),
                  ),
                ],
              ),
              AppSpacing.sby20,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppSocialButton(
                    label: "Google",
                    labelStyle: AppFont.appBold16.copyWith(
                      color: AppColor.appTextPrimary,
                    ),
                    logoName: "google_logo.svg",
                  ),
                  AppSocialButton(
                    label: "Apple",
                    logoHeight: 28,
                    logoWidth: 28,
                    labelStyle: AppFont.appBold16.copyWith(
                      color: AppColor.appTextPrimary,
                    ),
                    logoName: "apple_logo.svg",
                  ),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account?",
                    style: AppFont.appRegular14,
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(Routes.SIGN_UP_PAGE);
                    },
                    style: TextButton.styleFrom(
                      foregroundColor: AppColor.appPrimary,
                      textStyle: AppFont.appSemiBold14,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      overlayColor: Colors.transparent,
                      splashFactory: NoSplash.splashFactory,
                    ),
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
