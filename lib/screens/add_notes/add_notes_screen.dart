import 'package:flutter/material.dart';
import 'package:mynotes/screens/dialogs/save_question_dialog.dart';
import 'package:mynotes/screens/widget/text_from_file_sub_title.dart';
import 'package:mynotes/screens/widget/text_from_file_title.dart';
import 'package:mynotes/screens/widget/main_icon_button.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';

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
            onTab: () {
              Navigator.pop(context);
            },
            iconPath: AppImages.arrowBackSvg,
          ),
          const Spacer(),
          MainIconButton(
            onTab: () {
              showSaveQuestion(
                context,
                onTabSave: () {},
                onTabDiscard: () {},
                title: "O'zgarishlar saqlansinmi?",
              );
            },
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
