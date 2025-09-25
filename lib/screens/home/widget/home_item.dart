import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class HomeItem extends StatelessWidget {
  const HomeItem({
    super.key,
    required this.onTab,
    required this.notesModel,
    this.isShowCheck = true,
    required this.checkValue,
    required this.onChangedCheck,
    required this.onLongPress,
  });

  final VoidCallback onTab;
  final VoidCallback onLongPress;
  final NotesModel notesModel;
  final bool isShowCheck;
  final bool checkValue;
  final ValueChanged<bool?> onChangedCheck;

  @override
  Widget build(BuildContext context) {
    Color titleColor = ThemeData.estimateBrightnessForColor(notesModel.color) ==
            Brightness.light
        ? AppColors.black
        : AppColors.white;

    return Stack(
      children: [
        AnimatedPadding(
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.only(
            top: 8.he,
            bottom: 8.he,
            left: isShowCheck ? 45.we : 15.we,
            right: 15.we,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: notesModel.color,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [
                BoxShadow(
                  color: notesModel.color.withValues(alpha: 0.15),
                  offset: const Offset(0, 4),
                  blurRadius: 10,
                ),
                BoxShadow(
                  color: notesModel.color.withValues(alpha: 0.05),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
            child: CupertinoButton(
              onLongPress: onLongPress,
              onPressed: onTab,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 12.he,
                  horizontal: 12.we,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notesModel.title,
                      style: AppTextStyle.nunitoMedium.copyWith(
                        fontSize: 16.sp,
                        color: titleColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          notesModel.date,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: titleColor,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        AnimatedOpacity(
          opacity: isShowCheck ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(top: 10.he),
              child: Transform.scale(
                scale: 1.3,
                child: Checkbox(
                  activeColor: Colors.blue,
                  side: BorderSide(
                    color: AppColors.white, // Set the border color here
                    width: (1.5).w, // Set the border width here
                  ),
                  value: checkValue,
                  onChanged: isShowCheck ? onChangedCheck : null,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
