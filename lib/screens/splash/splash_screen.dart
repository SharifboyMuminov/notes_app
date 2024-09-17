import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';
import 'package:mynotes/data/local/storage_repository.dart';
import 'package:mynotes/screens/home/home_screen.dart';
import 'package:mynotes/screens/pin_code/pin_code_screen.dart';
import 'package:mynotes/utils/app_colors.dart';
import 'package:mynotes/utils/app_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _check();
    super.initState();
  }

  _check() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        var isPinCode = StorageRepository.getBool(
          key: "is_active_pin_code",
        );

        if (isPinCode) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const MyPinCodeScreen();
              },
            ),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const HomeScreen();
              },
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.c252525,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: AppColors.c252525,
      ),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Lottie.asset("assets/lottie/splash_animetion.json")],
        ),
      ),
    );
  }
}
