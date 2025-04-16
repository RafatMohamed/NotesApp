import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppNavigator {
  static void navigatorPush({
    required BuildContext context,
    required Widget navigatorToPage,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return navigatorToPage;
        },
      ),
    );
  }

  static void navigatorPop({required BuildContext context}) {
    return Navigator.pop(context);
  }

  static Future<T?> navigatorPushGo<T>({
    required BuildContext context,
    required Widget navigatorToPage,
  }) async {
    return Get.to<T>(
          () => navigatorToPage,
      duration: const Duration(seconds: 1),
      transition: Transition.fadeIn,
    );
  }

}
