import 'package:flutter/material.dart';
import 'package:notes_proj/core/helper/my_navigator_app.dart';
import 'package:notes_proj/core/resources/app_color.dart';

abstract class AppNotify {
  static SnackBar snackBar({
    required Widget widget,
    required BuildContext context,
  }) => SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: BeveledRectangleBorder(
      side: BorderSide(color: AppColor(context).whiteColor, width: 1.5),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 2),
    backgroundColor: AppColor(context).whiteColor,
    content: widget,
  );

  static Future<T?> showErrorDialog<T>({
    required BuildContext context,
    required String message,
    required String alertMess,
    required Function() onPressed,
  }) {
    return showDialog<T>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(alertMess),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => AppNavigator.navigatorPop(context: context),
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: Colors.green),
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: onPressed,
                child: const Text(
                  "yes delete",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
    );
  }

  static Widget circularProgress() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
        color: Colors.white,
      ),
    );
  }
}
