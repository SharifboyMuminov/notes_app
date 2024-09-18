import 'package:flutter/cupertino.dart';
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
    return Stack(
      children: [
        AnimatedContainer(
          width: double.infinity,
          duration: const Duration(milliseconds: 250),
          padding: EdgeInsets.only(
            top: 12.he,
            bottom: 12.he,
            left: isShowCheck ? 45.we : 15.we,
            right: 15.we,
          ),
          child: GestureDetector(
            onLongPress: onLongPress,
            child: CupertinoButton(
              padding: EdgeInsets.symmetric(vertical: 20.he, horizontal: 50.we),
              color: notesModel.color,
              borderRadius: BorderRadius.circular(10.r),
              onPressed: onTab,
              child: Text(
                notesModel.title,
                style: AppTextStyle.nunitoMedium.copyWith(
                  fontSize: 25.sp,
                  color: AppColors.black,
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
                child: CupertinoCheckbox(
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
