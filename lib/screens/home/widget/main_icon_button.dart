import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.onTab,
    required this.iconPath,
    this.colorSvg,
  });

  final VoidCallback onTab;
  final String iconPath;
  final Color? colorSvg;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: IconButton.styleFrom(
        padding: EdgeInsets.all(13.we),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
        backgroundColor: AppColors.c3B3B3B,
      ),
      onPressed: onTab,
      icon: SvgPicture.asset(
        iconPath,
        width: 24.we,
        height: 24.we,
        colorFilter:  ColorFilter.mode(
          colorSvg ?? AppColors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
