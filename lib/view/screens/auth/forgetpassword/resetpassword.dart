
import 'package:e_learningplatform/controller/forgetpassword/resetpassword_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/functions/validinput.dart';
import 'package:e_learningplatform/view/Widget/auth/custombuttonauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtextbodyauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtextformauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "23".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColor.kPrimaryColor,
        ),
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: ((controller) => HandlingDataRequest(
                statusRequest: controller.statusRequest,
                widget: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  child: Form(
                    key: controller.formState,
                    child: ListView(
                      children: [
                        CustomTextTitleAuth(textTitle: "24".tr),
                        const SizedBox(
                          height: 1,
                        ),
                        CustomTextBodyAuth(textBody: "30".tr),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormAuth(
                            obscureText: controller.isShoowpass,
                            onTapIcon: () {
                              controller.shoowPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            myController: controller.password,
                            hintText: "25".tr,
                            label: "6".tr,
                            icon: Icons.lock_outline),
                        CustomTextFormAuth(
                            obscureText: controller.isShoowpass,
                            onTapIcon: () {
                              controller.shoowPassword();
                            },
                            isNumber: false,
                            valid: (val) {
                              return validInput(val!, 5, 30, "password");
                            },
                            myController: controller.rePassword,
                            hintText: "28".tr,
                            label: "27".tr,
                            icon: Icons.lock_outline),
                        CustomButtonAuth(
                          text: "26".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                )))));
  }
}
