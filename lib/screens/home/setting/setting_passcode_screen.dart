import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/data/local/storage_repository.dart';
import 'package:mynotes/screens/home/setting/widget/setting_pin_code.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SettingPasscodeScreen extends StatefulWidget {
  const SettingPasscodeScreen({super.key});

  @override
  State<SettingPasscodeScreen> createState() => _SettingPasscodeScreenState();
}

class _SettingPasscodeScreenState extends State<SettingPasscodeScreen> {
  bool isActivePasscode = false;

  @override
  void initState() {
    isActivePasscode = StorageRepository.getBool(key: "is_active_pin_code");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.we),
        child: Column(
          children: [
            25.getH(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MainIconButton(
                  onTab: () => Navigator.pop(context),
                  iconPath: AppImages.arrowBackSvg,
                ),
                Text(
                  "Settings passcode ",
                  style: AppTextStyle.nunitoMedium.copyWith(
                    fontSize: 17.sp,
                    color: AppColors.white,
                  ),
                ),
                Text(
                  "ings",
                  style: AppTextStyle.nunitoMedium.copyWith(
                    fontSize: 17.sp,
                    color: Colors.transparent,
                  ),
                ),
              ],
            ),
            38.getH(),
            TextButton(
              style: TextButton.styleFrom(
                padding:
                    EdgeInsets.symmetric(horizontal: 16.we, vertical: 18.he),
                backgroundColor: AppColors.c3B3B3B,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
              onPressed: _onTabUsePin,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Use pin",
                    style: AppTextStyle.nunitoMedium.copyWith(
                      fontSize: 17.sp,
                      color: AppColors.white,
                    ),
                  ),
                  Switch(
                    activeColor: AppColors.white,
                    inactiveThumbColor: AppColors.c252525,
                    inactiveTrackColor: AppColors.c3B3B3B,
                    value: isActivePasscode,
                    onChanged: (bool value) {
                      _onTabUsePin();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTabUsePin() {
    setState(() {
      isActivePasscode = !isActivePasscode;
      StorageRepository.setBool(
        key: "is_active_pin_code",
        value: isActivePasscode,
      );
    });
    if (isActivePasscode) {
      StorageRepository.setString(
        key: "pin_code",
        value: "",
      );
      showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: AppColors.c252525,
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            topLeft: Radius.circular(8.r),
          ),
        ),
        builder: (BuildContext context) {
          return SettingPinCode(
            onChangedNewPinCode: (String value) {
              StorageRepository.setString(
                key: "pin_code",
                value: value,
              );
            },
          );
        },
      ).then((v) {
        _checkCodeIsEmpty();
      });
    }
  }

  void _checkCodeIsEmpty() {
    String pinCode = StorageRepository.getString(key: "pin_code");

    if (pinCode.isEmpty) {
      StorageRepository.setBool(
        key: "is_active_pin_code",
        value: false,
      );

      isActivePasscode = false;
    } else {
      StorageRepository.setBool(
        key: "is_active_pin_code",
        value: true,
      );
      isActivePasscode = true;
    }
    setState(() {});
  }
}
