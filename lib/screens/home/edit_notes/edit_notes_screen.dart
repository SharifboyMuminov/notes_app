import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/screens/home/dialogs/save_question_dialog.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/screens/home/widget/text_from_file_sub_title.dart';
import 'package:mynotes/screens/home/widget/text_from_file_title.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';

class EditNotesScreen extends StatefulWidget {
  const EditNotesScreen({super.key, required this.notesModel});

  final NotesModel notesModel;

  @override
  State<EditNotesScreen> createState() => _EditNotesScreenState();
}

class _EditNotesScreenState extends State<EditNotesScreen> {
  final TextEditingController controllerTitle = TextEditingController();
  final TextEditingController controllerSubTitle = TextEditingController();
  final FocusNode _focusNodeSubTitle = FocusNode();

  @override
  void initState() {
    controllerTitle.text = widget.notesModel.title;
    controllerSubTitle.text = widget.notesModel.subTitle;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.he,
        automaticallyImplyLeading: false,
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
              focusNode: _focusNodeSubTitle,
            ),
          ],
        ),
      ),
    );
  }

  void _onTabSave() {
    _focusNodeSubTitle.unfocus();
    context.read<NotesBloc>().add(NotesUpdateEvent(
            notesModel: widget.notesModel.copyWith(
          title: controllerTitle.text,
          subTitle: controllerSubTitle.text,
        )));
    Navigator.pop(context);
    Navigator.pop(context);
  }

  bool _checkChanges() {
    return (controllerTitle.text.isNotEmpty &&
                controllerSubTitle.text.isNotEmpty) &&
            widget.notesModel.title != controllerTitle.text ||
        widget.notesModel.subTitle != controllerSubTitle.text;
  }

  String _getTextForDialog() {
    if (_checkChanges()) {
      return "save_changes".tr();
    }

    return "empty_input".tr();
  }

  @override
  void dispose() {
    controllerTitle.dispose();
    controllerSubTitle.dispose();
    _focusNodeSubTitle.dispose();
    super.dispose();
  }
}
