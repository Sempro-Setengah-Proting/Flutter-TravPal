import 'package:flutter/cupertino.dart';

import '../constants/app_color.dart';
import '../constants/app_font.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.autofocus = false,
    this.enabled = true,
  });

  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool autofocus;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 44),
      child: CupertinoSearchTextField(
        controller: controller,
        focusNode: focusNode,
        placeholder: hintText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: autofocus,
        enabled: enabled,
        backgroundColor: AppColor.secondary50.withValues(alpha: 0.90),
        borderRadius: BorderRadius.circular(30),
        padding: const EdgeInsets.symmetric(vertical: 12),
        prefixInsets: const EdgeInsetsDirectional.fromSTEB(14, 12, 10, 12),
        suffixInsets: const EdgeInsetsDirectional.fromSTEB(8, 12, 14, 12),
        prefixIcon: const Icon(
          CupertinoIcons.search,
          color: AppColor.appPrimary,
        ),
        itemColor: AppColor.appTextSecondary,
        itemSize: 20,
        cursorColor: AppColor.appPrimary,
        style: AppFont.appRegular16.copyWith(color: AppColor.appTextPrimary),
        placeholderStyle: AppFont.appRegular16.copyWith(
          color: AppColor.appTextSecondary,
        ),
      ),
    );
  }
}
