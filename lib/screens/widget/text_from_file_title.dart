import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class TextFromFileTitle extends StatelessWidget {
  const TextFromFileTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      maxLines: null,
      style: AppTextStyle.nunitoRegular.copyWith(
        fontSize: 48.sp,
        color: AppColors.white,
      ),
      cursorColor: AppColors.white,
      cursorWidth: 3.we,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.zero,
        hintText: "Title",
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
