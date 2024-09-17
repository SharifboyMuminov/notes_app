import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/screens/home/add_notes/add_notes_screen.dart';
import 'package:mynotes/screens/home/setting/widget/setting_item.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Settings",
          style: AppTextStyle.nunitoMedium.copyWith(
            fontSize: 17.sp,
            color: AppColors.white,
          ),
        ),
        leading: MainIconButton(
          onTab: () => Navigator.pop(context),
          iconPath: AppImages.arrowBackSvg,
        ),
      ),
      body: Column(
        children: [
          SettingItem(
            onTab: () {},
            title: 'Passcode',
          ),
        ],
      ),
    );
  }
}
