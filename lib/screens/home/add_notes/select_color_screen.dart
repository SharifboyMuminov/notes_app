import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/bloc/notes/notes_event.dart';
import 'package:mynotes/data/local/local_varibals.dart';
import 'package:mynotes/data/model/notes_model.dart';
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
  double sliderValue = 20;
  Color currentColor = myColors.first;
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
                    "Choose a color",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  20.getH(),
                  Container(
                    width: width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: currentColor.withOpacity(
                        double.parse(
                          "0.${sliderValue.toInt() < 10 ? "0" : ""}${sliderValue.toInt()}",
                        ),
                      ),
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                  ),
                  20.getH(),
                  Wrap(
                    children: [
                      ...List.generate(
                        myColors.length,
                        (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 5.we,
                              vertical: 5.he,
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: myColors[index],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onPressed: () {
                                currentColor = myColors[index];
                                setState(() {});
                              },
                              child: SizedBox(
                                width: 50.we,
                                height: 50.we,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  20.getH(),
                  SizedBox(
                    width: double.infinity,
                    height: 50.he,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        gradient: LinearGradient(
                          colors: List.generate(
                            99,
                            (index) {
                              return currentColor.withOpacity(
                                double.parse(
                                  "0.${index < 10 ? "0" : ""}$index",
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  Slider.adaptive(
                    thumbColor: Colors.white,
                    activeColor: currentColor,
                    inactiveColor: AppColors.white,
                    value: sliderValue,
                    max: 99,
                    min: 5,
                    onChanged: (v) {
                      setState(() {
                        sliderValue = v;
                      });
                    },
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
                  backgroundColor: AppColors.c3B3B3B,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: _onTabSave,
                child: Text(
                  "Save",
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
      color: currentColor.withOpacity(
        double.parse(
          "0.${sliderValue.toInt() < 10 ? "0" : ""}${sliderValue.toInt()}",
        ),
      ),
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
