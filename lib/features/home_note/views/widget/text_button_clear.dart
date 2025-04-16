import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helper/my_navigator_app.dart';
import '../../../../core/helper/notify_app.dart';
import '../../../../core/resources/app_color.dart';
import '../../logic/home_note_cubit.dart';

Widget textClearNote(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
      backgroundColor: AppColor(context).whiteColor,
    ),
    onPressed: () async {
      final cubit = BlocProvider.of<HomeNoteCubit>(context);
      AppNotify.showErrorDialog(
        alertMess: "Clear All Notes",
        message: "you Want to delete the All Notes ",
        context: context,
        onPressed: () async {
          AppNavigator.navigatorPop(context: context);
          await cubit.clear();
          cubit.geDataNote();
        },
      );
      cubit.geDataNote();
    },
    child: Text(
      "Clear All",
      style: TextStyle(color: AppColor(context).blackColor, fontSize: 18),
    ),
  );
}
