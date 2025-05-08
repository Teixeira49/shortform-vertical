import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:venetiktok/src/variables/variables.dart';

class NotificationsService {
  static SnackbarController showSnackBar(
    String title,
    String message,
    BuildContext context,
  ) {
    return Get.snackbar(
      title,
      message,
      backgroundColor: ColorValues.bgBrandPrimary(context),
      margin: EdgeInsets.all(5.w),
      snackPosition: SnackPosition.BOTTOM,
      colorText: ColorValues.textWhite(context),
    );
  }
}
