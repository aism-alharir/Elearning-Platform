
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyMiddleawer extends GetMiddleware {
  @override
  int? get priority => 1;

  MyServices myServices = Get.find();
  @override
  RouteSettings? redirect(String? route) {
    if (myServices.sharedPreferences.getString("step") == "2") {
      return const RouteSettings(name: RoutesNames.homePage);
    }
    if (myServices.sharedPreferences.getString("onboarding") == "1") {
      return const RouteSettings(name: RoutesNames.login);
    }
    return null;
    
  }
}
