
import 'package:e_learningplatform/controller/onboarding_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonOnBoarding extends GetView<OnBoardingControllerImp> {
  const CustomButtonOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 40),
      height: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: MaterialButton(
        onPressed: () {
          controller.next();
        },
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 0),
        color: AppColor.kPrimaryColor,
        textColor: Colors.white,
        child: const Text("Continue"),
      ),
    );
  }
}
