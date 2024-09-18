import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class TextFromFileTitle extends StatelessWidget {
  const TextFromFileTitle({super.key, this.controller});

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      keyboardAppearance: Brightness.dark,
      controller: controller,
      textInputAction: TextInputAction.next,
      maxLines: null,
      style: AppTextStyle.nunitoRegular.copyWith(
        fontSize: 48.sp,
        color: AppColors.white,
      ),
      cursorColor: AppColors.white,
      cursorWidth: 3.we,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "title".tr(),
        hintStyle: AppTextStyle.nunitoRegular.copyWith(
          fontSize: 48.sp,
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
