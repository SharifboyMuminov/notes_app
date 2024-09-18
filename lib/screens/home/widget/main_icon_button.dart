import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class MainIconButton extends StatelessWidget {
  const MainIconButton({
    super.key,
    required this.onTab,
    required this.iconPath,
  });

  final VoidCallback onTab;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: AppColors.c3B3B3B,
      ),
      child: CupertinoButton(
        onPressed: onTab,
        child: SvgPicture.asset(
          iconPath,
          width: 24.we,
          height: 24.we,
          colorFilter: const ColorFilter.mode(
            AppColors.white,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
