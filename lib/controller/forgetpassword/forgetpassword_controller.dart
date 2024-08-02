
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/data/datasource/remote/forgetpassword/checkemail.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class ForgetPasswordController extends GetxController {
  cheekEmail();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  CheckEmailData checkEmailData = CheckEmailData(Get.find());
  StatusRequest statusRequest = StatusRequest.none;

  late TextEditingController email;

  @override
  cheekEmail() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await checkEmailData.postData(email.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          Get.offNamed(RoutesNames.resetPassword,arguments: {
            "email" : email
          });
        } else {
          Get.defaultDialog(
              title: "44".tr, middleText: "46".tr);
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    }
  }

  @override
  void onInit() {
    email = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }
}
