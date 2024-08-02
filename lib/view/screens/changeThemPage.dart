import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/changeThemcontrorller.dart';
import '../../responsive.dart';
import '../Widget/changeTheme/ButtunChangeThem.dart';
import '../Widget/changeTheme/arrowBack.dart';
import '../Widget/changeTheme/shupsun.dart';
import '../Widget/changeTheme/title.dart';

class ChangethemePage extends StatelessWidget {
  const ChangethemePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Changetheme controller = Get.find();
    return Scaffold(
        body: GetBuilder<Changetheme>(
      builder: (controller) => Responsive(
        mobile: Container(
          color: controller.isDark
              ? controller.primarycolordark
              : controller.primarycolorligth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Arrowback(),
              const SizedBox(
                height: 120,
              ),
              SizedBox(
                width: Get.width,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ShapeSun(),
                    Titlechangtheme(),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                    Buttonchangtheme(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
