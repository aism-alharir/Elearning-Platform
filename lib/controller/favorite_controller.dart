import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  Map isFavorite = {};
  MyServices myServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  List data = [];
  late StatusRequest statusRequest;
  // key => item_id
  // val => 0 Or 1
  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addFavorite(String courseid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFavorite(
        myServices.sharedPreferences.getString("id")!, courseid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.rawSnackbar(
        title: "53".tr,
        messageText: Text("54".tr),
      );
      //data.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  removeFavorite(String courseid) async {
    data.clear();
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.removeFavorite(
        myServices.sharedPreferences.getString("id")!, courseid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.rawSnackbar(
        title: "53".tr,
        messageText: Text("55".tr),
      );
      //data.addAll(response['data']);
    } else {
      statusRequest = StatusRequest.failure;
    }
  }
}
