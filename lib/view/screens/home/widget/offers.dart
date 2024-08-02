import 'package:e_learningplatform/controller/home/course_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Offers extends StatelessWidget {
final Function(int)? onPageChanged;
  const Offers({super.key, required this.onPageChanged});

  @override
  Widget build(BuildContext context) {
    CourseHomeController controller = Get.put(CourseHomeController());
    return SizedBox(
        height: 250,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              controller: controller.controllerpage,
              itemCount: controller.widgetList.length,
              itemBuilder: (context, index) => controller.widgetList[index],
              onPageChanged: onPageChanged,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int index = 0;
                      index < controller.widgetList.length;
                      index++)
                    if (index == controller.selectedpromo) ...[
                      createCircle(true)
                    ] else
                      createCircle(false)
                ],
              ),
            )
          ],
        ));
  }

  Widget createCircle(bool isCurent) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      duration: const Duration(milliseconds: 150),
      height: isCurent ? 12 : 8,
      width: isCurent ? 12 : 8,
      decoration: BoxDecoration(
          color: isCurent ? Colors.orange : Colors.grey,
          borderRadius: const BorderRadius.all(Radius.circular(12))),
    );
  }
}
