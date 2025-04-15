import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:notes_proj/app/logic/them_toggle_cubit.dart';
import '../core/constant/app_constant.dart';
import '../features/home_note/views/home_note_view.dart';
import 'logic/them_toggle_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemToggleCubit(),
      child: BlocBuilder<ThemToggleCubit, ThemToggleState>(
        builder: (context, state) {
          final cubit = context.read<ThemToggleCubit>();
          if (state is ThemToggleSuccess) {
            cubit.isDark = state.isDark;
          }
          return GetMaterialApp(
            title: kAppTitle,
            theme: ThemeData(
              brightness: cubit.isDark ? Brightness.dark : Brightness.light,
              fontFamily: kFontFamily,
            ),
            home: const HomeNoteView(),
          );
        },
      ),
    );
  }
}