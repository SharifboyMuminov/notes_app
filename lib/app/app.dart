import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mynotes/bloc/notes/notes_bloc.dart';
import 'package:mynotes/data/local/local_data_base.dart';
import 'package:mynotes/screens/splash/splash_screen.dart';
import 'package:mynotes/utils/app_colors.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => LocalDatabase()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => NotesBloc(
              context.read<LocalDatabase>(),
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      builder: (context, child) {
        ScreenUtil.init(context);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.c252525,
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.c252525,
            ),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
