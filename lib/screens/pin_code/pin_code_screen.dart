import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mynotes/data/local/storage_repository.dart';
import 'package:mynotes/screens/home/home_screen.dart';
import 'package:mynotes/screens/widget/passcode_item.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_images.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class MyPinCodeScreen extends StatefulWidget {
  const MyPinCodeScreen({super.key});

  @override
  PinCodeScreenState createState() => PinCodeScreenState();
}

class PinCodeScreenState extends State<MyPinCodeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Alignment> animationAlign;

  List<String> truePinCode = [];
  List<String> currentPin = [];
  int pinIndex = 0;
  bool isStartAnimation = true;
  Color currentColor = AppColors.white;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
      reverseDuration: const Duration(milliseconds: 500),
    );

    animationAlign = TweenSequence<Alignment>(
      [
        TweenSequenceItem<Alignment>(
            tween: Tween(begin: Alignment.center, end: Alignment.centerLeft),
            weight: 20),
        TweenSequenceItem<Alignment>(
            tween: Tween(begin: Alignment.centerLeft, end: Alignment.center),
            weight: 20),
        TweenSequenceItem<Alignment>(
            tween: Tween(begin: Alignment.center, end: Alignment.centerRight),
            weight: 20),
        TweenSequenceItem<Alignment>(
            tween: Tween(begin: Alignment.centerRight, end: Alignment.center),
            weight: 20),
      ],
    ).animate(animationController);
    animationController.addListener(() {
      setState(() {});
    });

    truePinCode = StorageRepository.getString(
      key: "pin_code",
    ).split("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: 31.he, left: 6.we, right: 6.we, bottom: 30.he),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              200.getH(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.we),
                child: Text(
                  'Enter the pin code...',
                  style: AppTextStyle.nunitoMedium.copyWith(
                    fontSize: 17.sp,
                    color: AppColors.white,
                  ),
                ),
              ),
              63.getH(),
              buildPinRow(),
              const Spacer(),
              Row(
                children: [
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("1");
                    },
                    title: "1",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("2");
                    },
                    title: "2",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("3");
                    },
                    title: "3",
                  ),
                ],
              ),
              8.getH(),
              Row(
                children: [
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("4");
                    },
                    title: "4",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("5");
                    },
                    title: "5",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("6");
                    },
                    title: "6",
                  ),
                ],
              ),
              8.getH(),
              Row(
                children: [
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("7");
                    },
                    title: "7",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("8");
                    },
                    title: "8",
                  ),
                  6.getW(),
                  PasscodeItem(
                    onTab: () {
                      _addCurrentPin("9");
                    },
                    title: "9",
                  ),
                ],
              ),
              8.getH(),
              Row(
                children: [
                  const Expanded(child: SizedBox()),
                  6.getW(),
                  PasscodeItem(
                      onTab: () {
                        _addCurrentPin("0");
                      },
                      title: "0"),
                  6.getW(),
                  Expanded(
                    child: TextButton(
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 22.he),
                      ),
                      child: SvgPicture.asset(
                        AppImages.clearSvg,
                        width: 27.we,
                        height: 21.he,
                        colorFilter: const ColorFilter.mode(
                            AppColors.white, BlendMode.srcIn),
                      ),
                      onPressed: () {
                        if (currentPin.isNotEmpty) {
                          currentPin.removeLast();
                          currentColor = AppColors.white;
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ],
              ),
              20.getH(),
            ],
          ),
        ),
      ),
    );
  }

  buildPinRow() {
    return Align(
      alignment: animationAlign.value,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          4,
          (index) {
            return buildPinNumber(index);
          },
        ),
      ),
    );
  }

  _addCurrentPin(String value) {
    if (currentPin.length != 4) {
      currentPin.add(value);
      if (currentPin.join() == truePinCode.join()) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const HomeScreen();
            },
          ),
        );
      } else if (currentPin.length == 4) {
        _startAnimation();
      } else {
        currentColor = AppColors.white;
      }
      setState(() {});
    } else {
      _startAnimation();
    }
  }

  _startAnimation() {
    currentColor = AppColors.cFF0000;
    if (isStartAnimation) {
      animationController.forward();
      isStartAnimation = false;
    } else {
      animationController.reverse();
      isStartAnimation = true;
    }
  }

  Widget buildPinNumber(int index) {
    return AnimatedContainer(
      padding: EdgeInsets.symmetric(horizontal: 8.we),
      decoration: BoxDecoration(
        color: currentPin.length > index ? currentColor : AppColors.c3B3B3B,
        shape: BoxShape.circle,
      ),
      duration: const Duration(milliseconds: 170),
      child: SizedBox(
        width: 36.we,
        height: 36.we,
      ),
    );
  }
}
