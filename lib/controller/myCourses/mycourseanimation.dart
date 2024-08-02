import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ListViewController extends GetxController {
  double width = 0;
  bool myAnimation = false;

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      myAnimation = true;
      update();
    });
  }
}