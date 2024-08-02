import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/mycourses.dart';
import 'package:e_learningplatform/data/model/mycoursemodel.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class MyCourseController extends GetxController {
  MyServices myServices = Get.find();
  MyCourseData myCourseData = MyCourseData(Get.find());
  List<MyCourseModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await myCourseData.getData(
      myServices.sharedPreferences.getString("id")!,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response;
      data.addAll(responseData.map((e) => MyCourseModel.fromJson(e)));
      print("data");
      print(data);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToVideo(String courseid) {
    Get.toNamed(RoutesNames.video, arguments: {
      "courseid": courseid,
    });
  }

  goToAssimentList(String courseid) {
    Get.toNamed(RoutesNames.assimentlist, arguments: {
      "courseid": courseid,
    });
  }

  goToVideoCall() {
    Get.toNamed(
      RoutesNames.homeVideoCall,
    );
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
