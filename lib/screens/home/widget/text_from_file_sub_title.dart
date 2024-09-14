import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_text_style.dart';

class TextFromFileSubTitle extends StatelessWidget {
  const TextFromFileSubTitle({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardAppearance: Brightness.dark,
      textInputAction: TextInputAction.done,
      maxLines: null,
      style: AppTextStyle.nunitoRegular.copyWith(
        fontSize: 23.sp,
        color: AppColors.white,
      ),
      cursorColor: AppColors.white,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "Type something...",
        hintStyle: AppTextStyle.nunitoRegular.copyWith(
          fontSize: 23.sp,
          color: AppColors.c9A9A9A,
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.transparent),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
