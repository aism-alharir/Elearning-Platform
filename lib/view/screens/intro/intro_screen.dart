import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/constant/imageasset.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AppImageAsset.intro,
              width: 350,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Geow Your Skills",
            style: TextStyle(fontSize: 25, color: Colors.grey.shade900),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Choose Your favorite course & start learning",
            style: TextStyle(fontSize: 17, color: Colors.grey.shade500),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                Get.toNamed(RoutesNames.homePage);
                // Navigator.pushNamed(context, RoutesNames.courseHome);
              },
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  primary: AppColor.kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Text(
                  "Getting Starts",
                  style: TextStyle(fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}
