import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';

class ColorButton extends StatelessWidget {
  const ColorButton({
    super.key,
    required this.onTab,
    required this.color,
    required this.isActive,
  });

  final VoidCallback onTab;
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.we,
        vertical: 5.we,
      ),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        onPressed: onTab,
        child: Stack(
          children: [
            SizedBox(
              width: 60.we,
              height: 60.we,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(10.r),
                ),
              ),
            ),
            if (isActive)
              Image.asset(
                AppImages.checkPng,
                fit: BoxFit.cover,
                width: 60.we,
                height: 60.we,
              ),
            if (isActive)
              SizedBox(
                width: 60.we,
                height: 60.we,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColors.c3B3B3B.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
