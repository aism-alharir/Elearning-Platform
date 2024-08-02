import 'package:e_learningplatform/controller/quize2_controller.dart';
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/assiment_data.dart';
import 'package:e_learningplatform/data/model/quizetion_model.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class AssimentListController extends GetxController {
  String? corseid;
  MyServices myServices = Get.find();
  AssimentData assimentData = AssimentData(Get.find());
  List<QuizetionModel> data = [];
  late StatusRequest statusRequest;

  getData() async {
    // data.clear();
    statusRequest = StatusRequest.loading;
    var response = await assimentData.getData(corseid!);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      List responseData = response;
      data.addAll(responseData.map((e) => QuizetionModel.fromJson(e)));
      print("data");
      print(data);
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  goToQuizeScreen(String quizeid) {
    Get.toNamed(RoutesNames.quizscrren, arguments: {
      "quizeid": quizeid,
    });
  }

  myBack() {
    Get.offAllNamed(RoutesNames.myCourseList);
    return Future.value(false);
  }

  @override
  void onInit() {
    corseid = Get.arguments['courseid'];
    getData();
    super.onInit();
  }
}
