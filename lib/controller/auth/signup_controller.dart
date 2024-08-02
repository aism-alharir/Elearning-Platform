
import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/data/datasource/remote/auth/signup.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController email;
  late TextEditingController phone;
  late TextEditingController password;

  StatusRequest statusRequest = StatusRequest.none;
  SignUpData signUpData = SignUpData(Get.find());

  List data = [];

  bool isShoowpass = true;
  shoowPassword() {
    isShoowpass = isShoowpass == true ? false : true;
    update();
  }

  @override
  goToSignIn() {
    Get.offNamed(RoutesNames.login);
  }

  @override
  signUp() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await signUpData.postData(
          userName.text,email.text, password.text  );
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        Get.offNamed(RoutesNames.successSignUp);
        // if (response['status'] == "success") {
        //   //data.addAll(response['data']);
        //   Get.offNamed(RoutesNames.successSignUp);
        // } else {
        //   Get.defaultDialog(
        //       title: "44".tr,
        //       middleText: "45".tr);
        //   statusRequest = StatusRequest.failure;
        // }
      }else{
         Get.defaultDialog(
              title: "44".tr,
              middleText: "45".tr);
          statusRequest = StatusRequest.failure;
      }
      update();
    } else {}
  }

  @override
  void onInit() {
    userName = TextEditingController();
    email = TextEditingController();
    phone = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    email.dispose();
    phone.dispose();
    password.dispose();
    super.dispose();
  }
}
