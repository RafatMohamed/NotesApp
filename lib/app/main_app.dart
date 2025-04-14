import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/app_constant.dart';
import '../features/home_note/views/home_note_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final bool isDark =true;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: kAppTitle,
      theme: ThemeData(
        brightness:isDark ? Brightness.dark: Brightness.light,
        fontFamily: kFontFamily,
      ),
      home: const HomeNoteView(),
    );
  }
}