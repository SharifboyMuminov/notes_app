import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class DialogButton extends StatelessWidget {
  const DialogButton({
    super.key,
    required this.title,
    required this.onTab,
    required this.backgroundColor,
    this.isActive = true,
  });

  final String title;
  final VoidCallback onTab;
  final Color backgroundColor;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : AppColors.c9A9A9A,
          borderRadius: BorderRadius.circular(5.r),
        ),
        child: CupertinoButton(
          padding: EdgeInsets.symmetric(horizontal: 25.we, vertical: 7.he),
          onPressed: isActive ? onTab : null,
          child: Text(
            title,
            maxLines: 1,
            style: TextStyle(
              color: AppColors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
