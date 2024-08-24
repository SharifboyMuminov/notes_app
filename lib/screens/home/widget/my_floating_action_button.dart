import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';

class MyFloatingActionButton extends StatelessWidget {
  const MyFloatingActionButton({super.key, required this.onTab});

  final VoidCallback onTab;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70.we,
      height: 70.we,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.c252525,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(-5, 0),
            ),
            BoxShadow(
              color: AppColors.black.withOpacity(0.4),
              blurRadius: 10,
              spreadRadius: 0,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: AppColors.c252525,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              100.r,
            ),
          ),
          onPressed: onTab,
          child: SvgPicture.asset(
            AppImages.plusSvg,
            width: 48.we,
            height: 48.we,
          ),
        ),
      ),
    );
  }
}
