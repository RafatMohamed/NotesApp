import 'package:flutter/material.dart';

abstract class AppNotify {
  static SnackBar snackBar({required Widget widget, required BuildContext context}) => SnackBar(
    dismissDirection: DismissDirection.startToEnd,
    behavior: SnackBarBehavior.floating,
    duration: const Duration(seconds: 2),
    shape: BeveledRectangleBorder(
      side: const BorderSide(color: Colors.white, width: 1.5),
      borderRadius: BorderRadius.circular(20),
    ),
    margin: const EdgeInsetsDirectional.only(start: 10, end: 10, bottom: 2),
    backgroundColor: Colors.green,
    content: widget,
  );

  static Future<T?> showErrorDialog<T>({
    required BuildContext context,
    required String message,
  }) {
    return showDialog<T>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text("error"),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Ok"),
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
