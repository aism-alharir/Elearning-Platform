import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Util {
  static void showMessage(
    BuildContext context,
    String message,
  ) {
    showMessageWithActioon(context, message, null, null);
  }

  static void showMessageWithActioon(BuildContext context, String message,
      String? actionLabel, VoidCallback? onPressed) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey.shade900,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
        action: actionLabel != null
            ? SnackBarAction(label: actionLabel, onPressed: onPressed!)
            : null,
        content: Text(
          message,
          style: const TextStyle(color: Colors.white, fontSize: 17),
        )));
  }

  static void openShoppingCart(BuildContext context) {
    Get.toNamed(RoutesNames.shoppingCart);
  }
}
