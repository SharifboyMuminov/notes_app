import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mynotes/app/app.dart';
import 'package:mynotes/data/local/storage_repository.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  StorageRepository.instance;

  runApp(const App());
}
