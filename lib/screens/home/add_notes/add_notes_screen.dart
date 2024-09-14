import 'package:flutter/material.dart';
import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/screens/home/add_notes/select_color_screen.dart';
import 'package:mynotes/screens/home/dialogs/save_question_dialog.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/screens/home/widget/text_from_file_sub_title.dart';
import 'package:mynotes/screens/home/widget/text_from_file_title.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerSubTitle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.he,
        actions: [
          15.getW(),
          MainIconButton(
            onTab: () {
              if (_checkChanges()) {
                showSaveQuestion(
                  context,
                  onTabSave: _onTabSave,
                  onTabDiscard: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  isActiveSave: _checkChanges(),
                  title: _getTextForDialog(),
                );
              } else {
                Navigator.pop(context);
              }
            },
            iconPath: AppImages.arrowBackSvg,
          ),
          const Spacer(),
          MainIconButton(
            onTab: () {
              showSaveQuestion(
                context,
                onTabSave: _onTabSave,
                onTabDiscard: () {
                  Navigator.pop(context);
                },
                isActiveSave: _checkChanges(),
                title: _getTextForDialog(),
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
            TextFromFileTitle(
              controller: controllerTitle,
            ),
            40.getH(),
            TextFromFileSubTitle(
              controller: controllerSubTitle,
            ),
          ],
        ),
      ),
    );
  }

  bool _checkChanges() {
    return controllerTitle.text.isNotEmpty &&
        controllerSubTitle.text.isNotEmpty;
  }

  String _getTextForDialog() {
    if (_checkChanges()) {
      return "O'zgarishlar saqlansinmi?";
    }

    return "O'zgarishlar yoq yoki bo'sht :)";
  }

  void _onTabSave() {
    // context.read<NotesBloc>().add(
    //       NotesAddEvent(
    //         notesModel: NotesModel(
    //           date: DateTime.now().toString(),
    //           color: AppColors.c30BE71,
    //           title: controllerTitle.text,
    //           subTitle: controllerSubTitle.text,
    //           createDate: DateTime.now().toString(),
    //         ),
    //       ),
    //     );
    // Future.microtask(() {
    //   Navigator.pop(context);
    //   Navigator.pop(context);
    // });
    NotesModel notesModel = NotesModel(
      date: DateTime.now().toString(),
      color: AppColors.c30BE71,
      title: controllerTitle.text,
      subTitle: controllerSubTitle.text,
      createDate: DateTime.now().toString(),
    );
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ColorScreen(
            noteModel: notesModel,
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    controllerSubTitle.dispose();
    controllerTitle.dispose();
    super.dispose();
  }
}
