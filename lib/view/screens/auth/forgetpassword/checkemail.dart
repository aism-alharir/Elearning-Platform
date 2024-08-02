
import 'package:e_learningplatform/controller/forgetpassword/forgetpassword_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/functions/validinput.dart';
import 'package:e_learningplatform/view/Widget/auth/custombuttonauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtextbodyauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtextformauth.dart';
import 'package:e_learningplatform/view/Widget/auth/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "8".tr,
            style: Theme.of(context)
                .textTheme
                .displayLarge
                ?.copyWith(color: AppColor.grey),
          ),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: AppColor.kPrimaryColor,
        ),
        body: GetBuilder<ForgetPasswordControllerImp>(
            builder: ((controller) =>
                HandlingDataRequest(statusRequest: controller.statusRequest, widget: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        child: Form(
                          key: controller.formState,
                          child: ListView(
                            children: [
                              CustomTextTitleAuth(textTitle: "17".tr),
                              const SizedBox(
                                height: 1,
                              ),
                              CustomTextBodyAuth(textBody: "21".tr),
                              const SizedBox(
                                height: 15,
                              ),
                              CustomTextFormAuth(
                                  isNumber: false,
                                  valid: (val) {
                                    return validInput(val!, 5, 30, "email");
                                  },
                                  myController: controller.email,
                                  hintText: "4".tr,
                                  label: "5".tr,
                                  icon: Icons.email_outlined),
                              CustomButtonAuth(
                                text: "18".tr,
                                onPressed: () {
                                  controller.cheekEmail();
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
