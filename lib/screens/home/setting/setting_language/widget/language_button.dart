import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class LanguageMyButton extends StatelessWidget {
  const LanguageMyButton({
    super.key,
    required this.onTab,
    required this.title,
    required this.iconPath,
    required this.active,
  });

  final VoidCallback onTab;
  final String title;
  final String iconPath;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16.he, horizontal: 20.we),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        backgroundColor: AppColors.c3B3B3B,
      ),
      onPressed: onTab,
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 24.we,
            height: 24.we,
          ),
          20.getW(),
          Expanded(
            child: Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.nunitoSemiBold.copyWith(
                fontSize: 16.sp,
                color: AppColors.white,
              ),
            ),
          ),
          if (active)
            SvgPicture.asset(
              AppImages.checkIconSvg,
              width: 16.we,
              height: 14.we,
              colorFilter: const ColorFilter.mode(
                AppColors.white,
                BlendMode.srcIn,
              ),
            ),
        ],
      ),
    );
  }
}
