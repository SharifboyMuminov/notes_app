import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/data/enums/language.dart';
import 'package:mynotes/screens/home/setting/setting_language/widget/language_button.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SettingLanguageScreen extends StatefulWidget {
  const SettingLanguageScreen({super.key, required this.onSet});

  final VoidCallback onSet;

  @override
  State<SettingLanguageScreen> createState() => _SettingLanguageScreenState();
}

class _SettingLanguageScreenState extends State<SettingLanguageScreen> {
  CurrentLanguage currentLanguage = CurrentLanguage.uzbek;

  @override
  void initState() {
    _getCurrentLanguage();
    super.initState();
  }

  void _getCurrentLanguage() {
    Future.microtask(() {
      final locale = EasyLocalization.of(context)!.currentLocale;
      if (locale!.languageCode == 'uz') {
        currentLanguage = CurrentLanguage.uzbek;
      } else if (locale.languageCode == 'ru') {
        currentLanguage = CurrentLanguage.russia;
      } else {
        currentLanguage = CurrentLanguage.english;
      }
      setState(() {});
    });
  }

  void _changeLanguage(Locale locale) {
    setState(() {
      EasyLocalization.of(context)!.setLocale(locale);
      widget.onSet.call();
    });
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
                  "language".tr(),
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
            20.getH(),
            LanguageMyButton(
              onTab: () {
                _changeLanguage(const Locale("uz", "UZ"));
              },
              title: 'uz'.tr(),
              iconPath: AppImages.uzbFlagSvg,
              active: currentLanguage == CurrentLanguage.uzbek,
            ),
            10.getH(),
            LanguageMyButton(
              onTab: () {
                _changeLanguage(const Locale('ru', 'RU'));
              },
              title: 'ru'.tr(),
              iconPath: AppImages.russiaFlagSvg,
              active: currentLanguage == CurrentLanguage.russia,
            ),
            10.getH(),
            LanguageMyButton(
              onTab: () {
                _changeLanguage(const Locale('en', 'EN'));
              },
              title: 'en'.tr(),
              iconPath: AppImages.americaFlagSvg,
              active: currentLanguage == CurrentLanguage.english,
            ),
          ],
        ),
      ),
    );
  }
}
