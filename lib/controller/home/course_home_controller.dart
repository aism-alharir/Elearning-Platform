import 'dart:async';
import 'dart:convert';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:http/http.dart' as http;
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/constant/imageasset.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/data/datasource/remote/course_data.dart';
import 'package:e_learningplatform/data/datasource/static/data_provider/course_data_provider.dart';
import 'package:e_learningplatform/data/model/course.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CourseHomeController extends GetxController {
  late StatusRequest statusRequest;
  CourseData courseData = CourseData(Get.find());
  MyServices myServices = Get.find();
  List<CourseModel> courseItems = [];
  List categories = [];
  String? username;

  List<Image> widgetList = [
    Image.asset(AppImageAsset.offer1, fit: BoxFit.fill),
    Image.asset(AppImageAsset.offer2, fit: BoxFit.fill),
    Image.asset(AppImageAsset.offer3, fit: BoxFit.fill),
  ];
  List<Course> featuredCourseList = [
    CourseDataProvider.courseList[0],
    CourseDataProvider.courseList[1],
    CourseDataProvider.courseList[2],
    CourseDataProvider.courseList[3],
    CourseDataProvider.courseList[4],
    CourseDataProvider.courseList[5],
    CourseDataProvider.courseList[6],
  ];

  int selectedpromo = 0;
  late Timer timer;
  final PageController controllerpage = PageController();

  @override
  void onInit() {
    username = myServices.sharedPreferences.getString("first_name");
    getData();
    getCategories();
    initalData();
    update();
    super.onInit();
  }

  initalData() {
    // timer = Timer.periodic(
    //   const Duration(seconds: 2),
    //   (timer) {
    //     if (selectedpromo < 2) {
    //       selectedpromo++;
    //     } else {
    //       selectedpromo = 0;
    //     }
    //   },
    // );

    if (controllerpage.positions.isNotEmpty) {
      controllerpage.animateToPage(selectedpromo,
          duration: const Duration(milliseconds: 400), curve: Curves.easeIn);
    }
    update();
  }

  goTOPageProductDetails(course) {
    Get.toNamed(RoutesNames.courseDetails, arguments: {"course": course});
  }

  changeSelectedPage(int selectedPage) {
    selectedpromo = selectedPage;
    update();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await courseData.getData();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // courseItems.addAll(response);
      List responsebody = response;
      courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      // categories.addAll(response);

      // List responsebody = response;
      // courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      // if (response['status'] == "success") {
      // categories.addAll(response['categories']['data']);
      // List responsebody = response;
      // courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      // items.addAll(response['items']['data']);
      // } else {
      //   statusRequest = StatusRequest.failure;
      // }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  getCategories() async {
    statusRequest = StatusRequest.loading;
    var response = await courseData.getCategory();
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      // courseItems.addAll(response);
      // List responsebody = response;
      // courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      categories.addAll(response);

      // List responsebody = response;
      // courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      // if (response['status'] == "success") {
      // categories.addAll(response['categories']['data']);
      // List responsebody = response;
      // courseItems.addAll(responsebody.map((e) => CourseModel.fromJson(e)));
      // items.addAll(response['items']['data']);
      // } else {
      //   statusRequest = StatusRequest.failure;
      // }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToItems(List categories, int selectedCategories, String categoriesid) {
    Get.toNamed(RoutesNames.items, arguments: {
      "categories": categories,
      "selectedCategories": selectedCategories,
      "categoriesid": categoriesid
    });
  }
}



// class SearchMixController extends GetxController {
//   SearchData searchData_ = SearchData(Get.find());
//   late StatusRequest statusRequest;
//   TextEditingController? search;
//   List<ItemsModel> listData = [];
//   bool isSearch = false;
//   chechSearch(val) {
//     if (val == "") {
//       statusRequest = StatusRequest.none;
//       isSearch = false;
//     }
//     update();
//   }

//   onSearchItems() {
//     isSearch = true;
//     searchData();
//     update();
//   }

//   searchData() async {
//     statusRequest = StatusRequest.loading;
//     var response = await searchData_.searchData(search!.text);
//     statusRequest = handlingData(response);
//     if (StatusRequest.success == statusRequest) {
//       if (response['status'] == "success") {
//         listData.clear();
//         List responsebody = response['data'];
//         listData.addAll(responsebody.map((e) => ItemsModel.fromJson(e)));
//       } else {
//         statusRequest = StatusRequest.failure;
//       }
//     }
//     update();
//   }
// }
