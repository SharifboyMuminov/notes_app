import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/screens/home/add_notes/add_notes_screen.dart';
import 'package:mynotes/screens/home/widget/home_item.dart';
import 'package:mynotes/screens/home/widget/main_icon_button.dart';
import 'package:mynotes/screens/home/widget/my_floating_action_button.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100.he,
        centerTitle: false,
        title: Text(
          "Notes",
          style: AppTextStyle.nunitoSemiBold.copyWith(
            fontSize: 43.sp,
          ),
        ),
        actions: [
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
      body: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.we),
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return HomeItem(
            onTab: () {},
            title: "Book Review : The Design of Everyday Things by Don Norman",
          );
        },
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
}
