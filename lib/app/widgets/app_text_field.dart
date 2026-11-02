import 'package:flutter/material.dart';
import 'package:trav_pal_flutter/app/constants/app_color.dart';
import 'package:trav_pal_flutter/app/constants/app_font.dart';
import 'package:trav_pal_flutter/app/constants/app_spacing.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    this.hintText,
    this.controller,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.validator,
    this.autofillHints,
    this.obscureText = false,
    this.enabled = true,
  });

  final String label;
  final String? hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FormFieldValidator<String>? validator;
  final Iterable<String>? autofillHints;
  final bool obscureText;
  final bool enabled;

  static const OutlineInputBorder _border = OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(30)),
    borderSide: BorderSide(color: AppColor.appGrey),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          label,
          style: AppFont.appRegular16.copyWith(color: AppColor.appTextPrimary),
        ),
        AppSpacing.sby4,
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              if (enabled)
                BoxShadow(
                  color: AppColor.secondary950.withValues(alpha: 0.04),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: TextFormField(
            controller: controller,
            focusNode: focusNode,
            keyboardType: keyboardType,
            textInputAction: textInputAction,
            validator: validator,
            autofillHints: autofillHints,
            obscureText: obscureText,
            enabled: enabled,
            autocorrect: !obscureText,
            enableSuggestions: !obscureText,
            cursorColor: AppColor.appPrimary,
            style: AppFont.appRegular16.copyWith(
              color: enabled
                  ? AppColor.appTextPrimary
                  : AppColor.appTextSecondary,
            ),
            decoration: InputDecoration(
              hintText: hintText ?? label,
              hintStyle: AppFont.appRegular16.copyWith(color: AppColor.appGrey),
              filled: true,
              fillColor: enabled ? AppColor.secondary50 : AppColor.neutral300,
              isDense: true,
              constraints: const BoxConstraints(minHeight: 48),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              border: _border,
              enabledBorder: _border,
              disabledBorder: _border.copyWith(
                borderSide: const BorderSide(color: AppColor.appBorder),
              ),
              focusedBorder: _border.copyWith(
                borderSide: const BorderSide(color: AppColor.appPrimary),
              ),
              errorBorder: _border.copyWith(
                borderSide: const BorderSide(color: AppColor.appDanger),
              ),
              focusedErrorBorder: _border.copyWith(
                borderSide: const BorderSide(color: AppColor.appDanger),
              ),
              errorStyle: AppFont.appRegular12.copyWith(
                color: AppColor.appDanger,
              ),
              errorMaxLines: 3,
            ),
          ),
        ),
      ],
    );
  }
}
