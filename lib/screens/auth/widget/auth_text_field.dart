import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.onChanged,
    this.isShowIcon,
    this.hintText,
    this.onTabSuffixIcon,
  });

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  final VoidCallback? onTabSuffixIcon;

  final bool? isShowIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isShowIcon ?? false,
      controller: controller,
      focusNode: focusNode,
      onChanged: onChanged,
      cursorColor: AppColors.white,
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.done,
      style: AppTextStyle.nunitoRegular.copyWith(
        fontSize: 16.sp,
        color: AppColors.white,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.c3B3B3B,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 10.we, vertical: 14.he),
        hintText: hintText,
        hintStyle: AppTextStyle.nunitoRegular.copyWith(
          fontSize: 15.sp,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.r),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        suffixIcon: isShowIcon != null
            ? IconButton(
                onPressed: onTabSuffixIcon,
                icon: Icon(
                  isShowIcon! ? Icons.remove_red_eye : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }
}
