import 'dart:developer';
import 'package:get/get.dart';

class CommonRoute {
  static Future<void> pushNamed({
    required String page,
    dynamic arguments,
  }) async {
    log(page);
    await Get.toNamed(page, arguments: arguments);
  }

  static Future<void> popAndPushNamed({
    required String page,
    dynamic arguments,
  }) async {
    log(page);
    await Get.offAllNamed(page, arguments: arguments);
  }

  static void pushReplacementNamed({required String page, dynamic arguments}) {
    log(page);
    Get.offAndToNamed(page, arguments: arguments);
  }

  static void pop() {
    Get.back();
  }
}
