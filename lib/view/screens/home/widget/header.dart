import 'package:e_learningplatform/controller/home/course_home_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Header extends GetView<CourseHomeController> {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome ${controller.username!}",
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Let is learn somthing new today!",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        Row(
          children: [
            Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: AppColor.kOptionColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications),
                          color: Colors.white),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ],
                  ),
                )),
            const SizedBox(
              width: 10,
            ),
            Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                    color: AppColor.kOptionColor,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person),
                  color: Colors.white,
                ))
          ],
        )
      ],
    );
  }
}
