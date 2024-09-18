import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.onTab,
    required this.title,
    this.titleColor,
  });

  final VoidCallback onTab;
  final String title;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      borderRadius: BorderRadius.circular(10.r),
      color: AppColors.c3B3B3B,
      padding: EdgeInsets.symmetric(vertical: 20.he, horizontal: 16.we),
      onPressed: onTab,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: AppTextStyle.nunitoMedium.copyWith(
                fontSize: 17.sp,
                color: titleColor ?? AppColors.white,
              ),
            ),
          ),
          SvgPicture.asset(
            AppImages.arrowRightSvg,
            width: 24.we,
          ),
        ],
      ),
    );
  }
}
