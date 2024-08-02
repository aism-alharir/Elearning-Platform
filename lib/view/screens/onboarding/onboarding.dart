import 'package:e_learningplatform/controller/onboarding_controller.dart';
import 'package:e_learningplatform/view/screens/onboarding/widget/custombutton.dart';
import 'package:e_learningplatform/view/screens/onboarding/widget/customslider.dart';
import 'package:e_learningplatform/view/screens/onboarding/widget/dotcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    return const Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          Expanded(flex: 4, child: CustomSliderOnBoarding()),
          Expanded(
              flex: 1,
              child: Column(
                children: [
                  CustomDotControllerOnBoarding(),
                  Spacer(
                    flex: 2,
                  ),
                  CustomButtonOnBoarding()
                ],
              ))
        ],
      )),
    );
  }
}
