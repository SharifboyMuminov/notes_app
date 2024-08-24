import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onTab,
    required this.title,
  });

  final VoidCallback onTab;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.he),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 30.he, horizontal: 50.we),
          backgroundColor: const Color(0xFFFF9E9E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onTab,
        child: Text(
          title,
          style: AppTextStyle.nunitoRegular.copyWith(
            fontSize: 25.sp,
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
