import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SearchTextFiled extends StatelessWidget {
  const SearchTextFiled({
    super.key,
    required this.onTab,
    required this.isShowSearch,
    required this.onChanged,
  });

  final VoidCallback onTab;
  final bool isShowSearch;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isShowSearch ? (width - 90.we) : 50.we,
      height: 62.he,
      duration: const Duration(milliseconds: 600),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.c3B3B3B,
      ),
      child: Row(
        children: [
          if (isShowSearch)
            Expanded(
              child: TextFormField(
                cursorColor: AppColors.white,
                onChanged: onChanged,
                keyboardAppearance: Brightness.dark,
                textInputAction: TextInputAction.done,
                style: AppTextStyle.nunitoRegular.copyWith(
                  fontSize: 16.sp,
                  color: AppColors.white,
                ),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10.we),
                  hintText: "Searching...",
                  hintStyle: AppTextStyle.nunitoRegular.copyWith(
                    fontSize: 15.sp,
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.zero,
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                ),
              ),
            ),
          if (!isShowSearch)
            IconButton(
              style: IconButton.styleFrom(
                padding: EdgeInsets.all(13.we),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
                backgroundColor: AppColors.c3B3B3B,
              ),
              onPressed: onTab,
              icon: SvgPicture.asset(
                AppImages.searchSvg,
                width: 24.we,
                height: 24.we,
                colorFilter: const ColorFilter.mode(
                  AppColors.white,
                  BlendMode.srcIn,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
