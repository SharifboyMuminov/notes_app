import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/data/local/local_varibals.dart';
import 'package:mynotes/data/model/notes_model.dart';
import 'package:mynotes/screens/home/add_notes/widget/color_button.dart';
import 'package:mynotes/screens/home/home_screen.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key, required this.noteModel});

  final NotesModel noteModel;

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  int currentColorIndex = 0;
  late NotesModel noteModel;

  @override
  void initState() {
    noteModel = widget.noteModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.c252525,
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                top: 40.he,
                left: 10.we,
                right: 10.we,
                bottom: 60.he,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "choose_color".tr(),
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.getH(),
                  Wrap(
                    children: [
                      ...List.generate(
                        myColors.length,
                        (index) {
                          return ColorButton(
                            onTab: () {
                              currentColorIndex = index;
                              setState(() {});
                            },
                            color: myColors[index],
                            isActive: currentColorIndex == index,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.we),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15.he),
                  backgroundColor: AppColors.c30BE71,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: _onTabSave,
                child: Text(
                  "save".tr(),
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _onTabSave() {
    DateTime dateTime = DateTime.now();

    String nowDate = "${dateTime.day}/${dateTime.month}/${dateTime.year}";
    noteModel = noteModel.copyWith(
      color: myColors[currentColorIndex],
      date: nowDate,
    );
    context.read<NotesBloc>().add(
          NotesAddEvent(
            notesModel: noteModel,
          ),
        );
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
      builder: (context) {
        return const HomeScreen();
      },
    ), (route) => false);
  }
}
