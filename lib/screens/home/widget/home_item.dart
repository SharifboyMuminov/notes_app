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
  });

  final VoidCallback onTab;
  final NotesModel notesModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.he),
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
    );
  }
}
