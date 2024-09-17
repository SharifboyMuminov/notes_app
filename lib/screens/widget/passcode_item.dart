import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class PasscodeItem extends StatelessWidget {
  const PasscodeItem({
    super.key,
    required this.onTab,
    required this.title,
  });

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.c3B3B3B,
          borderRadius: BorderRadius.circular(5.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.35),
              blurRadius: 0,
              spreadRadius: 0,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.only(bottom: 18.he, top: 6.he),
            alignment: Alignment.topCenter,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.r),
            ),
            backgroundColor: AppColors.c3B3B3B,
          ),
          onPressed: onTab,
          child: Text(
            title,
            style: AppTextStyle.nunitoRegular.copyWith(
              fontSize: 25.sp,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}
