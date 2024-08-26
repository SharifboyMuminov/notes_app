import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/screens/widget/text_from_file_sub_title.dart';
import 'package:mynotes/screens/widget/text_from_file_title.dart';
import 'package:mynotes/screens/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key});

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.he,
        actions: [
          15.getW(),
          MainIconButton(
            onTab: () {
              Navigator.pop(context);
            },
            iconPath: AppImages.arrowBackSvg,
          ),
          const Spacer(),
          MainIconButton(
            onTab: () {},
            iconPath: AppImages.saveSvg,
          ),
          15.getW(),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.we),
        child: Column(
          children: [
            TextFromFileTitle(),
            40.getH(),
            TextFromFileSubTitle(),

          ],
        ),
      ),
    );
  }
}
