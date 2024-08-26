import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mynotes/screens/widget/dialog_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

showSaveQuestion(
  BuildContext context, {
  required VoidCallback onTabSave,
  required VoidCallback onTabDiscard,
  required String title,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        iconPadding: EdgeInsets.symmetric(vertical: 20.he),
        backgroundColor: AppColors.c252525,
        title: Text(
          title,
          style: AppTextStyle.nunitoMedium.copyWith(
            color: AppColors.cCFCFCF,
          ),
        ),
        icon: SvgPicture.asset(
          AppImages.undovBlackSvg,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.r),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.we),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DialogButton(
                    title: "Discard",
                    onTab: onTabDiscard,
                    backgroundColor: AppColors.cFF0000),
                DialogButton(
                  title: 'Save',
                  onTab: onTabSave,
                  backgroundColor: AppColors.c30BE71,
                ),
              ],
            ),
          ),
        ],
        actionsPadding: EdgeInsets.symmetric(
          vertical: 30.he,
        ),
      );
    },
  );
}
