import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/main.dart';
import 'package:mynotes/screens/add_notes/widget/text_from_file_title.dart';
import 'package:mynotes/screens/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.he,
        actions: [
          15.getW(),
          MainIconButton(
            onTab: () {},
            iconPath: AppImages.searchSvg,
          ),
          const Spacer(),
          MainIconButton(
            onTab: () {},
            iconPath: AppImages.searchSvg,
          ),
          15.getW(),
          MainIconButton(
            onTab: () {},
            iconPath: AppImages.noneNameSvg,
          ),
          15.getW(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.we),
        child: Column(
          children: [
            TextFromFileTitle(),
          ],
        ),
      ),
    );
  }
}
