import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/screens/auth/widget/auth_text_field.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';
import 'package:mynotes/utils/app_text_style.dart';

class SignUnScreen extends StatefulWidget {
  const SignUnScreen({super.key});

  @override
  State<SignUnScreen> createState() => _SignUnScreenState();
}

class _SignUnScreenState extends State<SignUnScreen> {
  bool _obscureTextPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.we),
          child: Column(
            children: [
              AuthTextField(
                hintText: "Email",
              ),
              10.getH(),
              AuthTextField(
                hintText: "Password",
                onTabSuffixIcon: () {
                  setState(() {
                    _obscureTextPassword = !_obscureTextPassword;
                  });
                },
                isShowIcon: _obscureTextPassword,
              ),
              10.getH(),
              TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.all(10.we),
                  backgroundColor: AppColors.c3B3B3B,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {},
                child: Image.asset(
                  "assets/images/google_icon.png",
                  width: 50,
                  height: 50,
                ),
              ),
              20.getH(),
              SizedBox(
                width: width,
                child: TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.all(10.we),
                    backgroundColor: AppColors.c3B3B3B,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Sign In",
                    style: AppTextStyle.nunitoBold.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
