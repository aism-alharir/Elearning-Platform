import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../core/constant/themDarkandMode.dart';
import '../core/services/services.dart';


class Changetheme extends GetxController {
  MyServices myServices = Get.find();
  late bool isDark;

  getdark() {
    bool? dark = myServices.sharedPreferences.getBool("dark");
    if (dark == null) {
      dark = false;
      isDark = dark;
    } else {
      dark = myServices.sharedPreferences.getBool("dark");
      isDark = dark!;
    }
    update();
  }

  final primarycolorligth = const Color(0xffd8e0ed);
  final primarycolordark = const Color(0xff2e3243);
  ligthmode() {
    isDark = false;
    Get.changeTheme(ThemeEdite.light);
    myServices.sharedPreferences.remove("dark");
    update();
  }

  darkmode() {
    isDark = true;
    Get.changeTheme(ThemeEdite.dark);
    myServices.sharedPreferences.setBool("dark", isDark);
    update();
  }

  @override
  void onInit() {
    getdark();
    super.onInit();
  }
}