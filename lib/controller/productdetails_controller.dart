
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/cart_data.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {
  initialData();
}

class ProductDetailsControllerImp extends ProductDetailsController {
  late CourseModel courseModel;
  //CartController cartController = Get.put(CartController());
  List subItems = [
    {"name": "red", "id": "1", "active": "0"},
    {"name": "green", "id": "2", "active": "1"},
    {"name": "blue", "id": "3", "active": "0"},
  ];
   MyServices myServices = Get.find();
   CartData cartData = CartData(Get.find());
  late StatusRequest statusRequest;
  int countItems = 0;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  @override
  initialData() async {
    statusRequest = StatusRequest.loading;
    courseModel = Get.arguments['courseModel'];
    // countItems =
    //     await getCountItems(courseModel.id.toString());
    statusRequest = StatusRequest.success;
    update();
  }

  addItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "53".tr,
          messageText: Text("56".tr),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
   deleteItems(String itemsid) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.deleteCart(
        myServices.sharedPreferences.getString("id")!, itemsid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.rawSnackbar(
          title: "53".tr,
          messageText: Text("57".tr),
        );
        //data.addAll(response['data']);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goTOPageCheckOut(courseModel) {
    Get.toNamed(RoutesNames.checkout,
        arguments: {"courseModel": courseModel});
    // Get.toNamed(AppRoutes.productDetails,
    //     arguments: {"itemsModel": itemsModel});
  }

  
  // getCountItems(String itemsid) async {
  //   statusRequest = StatusRequest.loading;
  //   var response = await cartData.getCountItems(
  //       myServices.sharedPreferences.getString("id")!, itemsid);
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       int countItems = 0;
  //       countItems = response['data'];
  //       print("--------------");
  //       print(countItems);
  //       return countItems;
  //       //data.addAll(response['data']);
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //   }
  // }

  add() {
    addItems(courseModel.id.toString());
    countItems++;
    update();
  }

  remove() {
    if (countItems > 0) {
      deleteItems(courseModel.id.toString());
      countItems--;
      update();
    }
  }
}
