import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/bloc/notes/notes_state.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/screens/home/add_notes/add_notes_screen.dart';
import 'package:mynotes/screens/home/dialogs/save_question_dialog.dart';
import 'package:mynotes/screens/home/edit_notes/edit_notes_screen.dart';
import 'package:mynotes/screens/home/setting/setting_screen.dart';
import 'package:mynotes/screens/home/widget/home_item.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/screens/home/widget/my_floating_action_button.dart';
import 'package:mynotes/screens/home/widget/search_text_filed.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isShowSearch = false;
  bool isShowCheck = false;
  List<NotesModel> notesModels = [];

  @override
  void initState() {
    Future.microtask(() {
      context.read<NotesBloc>().add(NotesFetchEvent());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 100.he,
        centerTitle: false,
        title: isShowSearch
            ? null
            : Text(
                "Notes",
                style: AppTextStyle.nunitoSemiBold.copyWith(
                  fontSize: 43.sp,
                ),
              ),
        actions: [
          SearchTextFiled(
            onTab: () {
              if (isShowCheck) {
                notesModels = [...context.read<NotesBloc>().state.allNotes];
              } else {
                isShowSearch = !isShowSearch;
              }
              setState(() {});
            },
            isShowSearch: isShowSearch,
            onChanged: (value) {
              context.read<NotesBloc>().add(
                    NotesSearchEvent(
                      title: value,
                    ),
                  );
            },
            iconPath:
                isShowCheck ? AppImages.deleteAllSvg : AppImages.searchSvg,
          ),
          15.getW(),
          MainIconButton(
            onTab: _onTabPopularIconButton,
            iconPath: _getIconPathPopularIConButton(),
          ),
          15.getW(),
        ],
      ),
      body: BlocConsumer<NotesBloc, NotesState>(
        builder: (BuildContext context, NotesState state) {
          if (state.formStatus == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.allNotes.isEmpty) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: 80.he,
                left: 10.we,
                right: 10.we,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.emptyPng,
                    fit: BoxFit.cover,
                  ),
                  6.getH(),
                  Text(
                    "create_notes".tr(),
                    textAlign: TextAlign.center,
                    style: AppTextStyle.nunitoLight.copyWith(
                      fontSize: 20.sp,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            );
          }

          return ListView.builder(
            padding: EdgeInsets.only(bottom: 100.he),
            itemCount: state.allNotes.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeItem(
                onTab: () {
                  _onTabHomeItem(state.allNotes[index]);
                },
                notesModel: state.allNotes[index],
                isShowCheck: isShowCheck,
                checkValue: notesModels.contains(state.allNotes[index]),
                onChangedCheck: (bool? value) {
                  _addOrRemoveNotes(state.allNotes[index]);
                },
                onLongPress: () {
                  if (!isShowSearch) {
                    setState(() {
                      isShowCheck = true;
                      _addOrRemoveNotes(state.allNotes[index]);
                    });
                  }
                },
              );
            },
          );
        },
        listener: (BuildContext context, NotesState state) {},
      ),
      floatingActionButton: MyFloatingActionButton(onTab: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const AddNotesScreen();
            },
          ),
        );
      }),
    );
  }

  void _onTabHomeItem(NotesModel notesModel) {
    if (isShowCheck) {
      _addOrRemoveNotes(notesModel);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return EditNotesScreen(
              notesModel: notesModel,
            );
          },
        ),
      );
    }
  }

  void _addOrRemoveNotes(NotesModel notesModel) {
    if (notesModels.contains(notesModel)) {
      notesModels.remove(notesModel);
    } else {
      notesModels.add(notesModel);
    }
    setState(() {});
  }

  String _getIconPathPopularIConButton() {
    if (isShowSearch || (notesModels.isEmpty && isShowCheck)) {
      return AppImages.closeSvg;
    }
    if (isShowCheck) {
      return AppImages.deleteSvg;
    }

    return AppImages.settingsSvg;
  }

  void _onTabPopularIconButton() {
    if (isShowSearch) {
      setState(() {
        isShowSearch = !isShowSearch;
        if (!isShowSearch) {
          context.read<NotesBloc>().add(NotesFetchEvent());
          FocusScope.of(context).unfocus();
        }
      });
    } else if (isShowCheck) {
      if (notesModels.isNotEmpty) {
        showSaveQuestion(
          context,
          onTabSave: () {
            context
                .read<NotesBloc>()
                .add(NotesDeleteEvent(notesModels: notesModels));
            setState(() {
              notesModels = [];

              isShowCheck = false;
            });
            Navigator.pop(context);
          },
          onTabDiscard: () {
            setState(() {
              notesModels = [];

              isShowCheck = false;
            });
            Navigator.pop(context);
          },
          title: "delete_data".tr(),
          discardTitle: "discard".tr(),
          saveTitle: 'yes'.tr(),
        );
      } else {
        setState(() {
          notesModels = [];

          isShowCheck = false;
        });
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return const SettingScreen();
          },
        ),
      ).then((v) => setState(() {}));
    }
  }
}
