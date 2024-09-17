import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/bloc/notes/notes_state.dart';
import 'package:mynotes/data/enums/form_status.dart';
import 'package:mynotes/screens/home/add_notes/add_notes_screen.dart';
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
  final TextEditingController controllerSearch = TextEditingController();

  bool isShowSearch = false;

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
          // if (isShowSearch) 15.getW(),
          SearchTextFiled(
            onTab: () {
              setState(() {
                isShowSearch = !isShowSearch;
              });
            },
            isShowSearch: isShowSearch,
            controller: controllerSearch,
          ),
          15.getW(),

          MainIconButton(
            onTab: () {
              if (isShowSearch) {
                setState(() {
                  isShowSearch = !isShowSearch;
                });
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const SettingScreen();
                    },
                  ),
                );
              }
            },
            iconPath: isShowSearch ? AppImages.closeSvg : AppImages.settingsSvg,
          ),
          // 15.getW(),
        ],
      ),
      body: BlocConsumer<NotesBloc, NotesState>(
        builder: (BuildContext context, NotesState state) {
          if (state.formStatus == FormStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.currentNotes.isEmpty) {
            return Padding(
              padding: EdgeInsets.only(bottom: 80.he),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.emptyPng,
                    fit: BoxFit.cover,
                  ),
                  6.getH(),
                  Text(
                    "Create your first note !",
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
            padding: EdgeInsets.only(left: 15.we, right: 15.we, bottom: 100.he),
            itemCount: state.currentNotes.length,
            itemBuilder: (BuildContext context, int index) {
              return HomeItem(
                onTab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditNotesScreen(
                          notesModel: state.currentNotes[index],
                        );
                      },
                    ),
                  );
                },
                notesModel: state.currentNotes[index],
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
              return AddNotesScreen();
            },
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    controllerSearch.dispose();
    super.dispose();
  }
}
