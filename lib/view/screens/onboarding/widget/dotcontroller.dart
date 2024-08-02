import 'package:e_learningplatform/controller/onboarding_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/datasource/static/onboarding/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDotControllerOnBoarding extends StatelessWidget {
  const CustomDotControllerOnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingControllerImp>(
        builder: ((controller) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(
                    onBoardingList.length,
                    (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 900),
                          margin: const EdgeInsets.only(right: 5),
                          width: controller.curentPage == index ? 20 : 5,
                          height: 6,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.kPrimaryColor),
                        ))
              ],
            )));
  }
}
