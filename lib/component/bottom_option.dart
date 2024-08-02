import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomOption extends StatelessWidget {
  final int slecetedIndex;
  const BottomOption({super.key, required this.slecetedIndex});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                openScreen(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.home, color: getSlectedColor(1)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Home",
                        style:
                            TextStyle(fontSize: 13, color: getSlectedColor(1))),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.play_circle_outline, color: getSlectedColor(2)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("My Courses",
                        style:
                            TextStyle(fontSize: 13, color: getSlectedColor(2))),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 3);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.favorite_border, color: getSlectedColor(3)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Favorite",
                        style:
                            TextStyle(fontSize: 13, color: getSlectedColor(3))),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                openScreen(context, 4);
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.people, color: getSlectedColor(4)),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("Account",
                        style:
                            TextStyle(fontSize: 13, color: getSlectedColor(4))),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color getSlectedColor(int optionIndex) {
    return (slecetedIndex == optionIndex)
        ? AppColor.kPrimaryColor
        : Colors.grey.shade800;
  }

  void openScreen(BuildContext context, int selectedOptionNo) {
    String routeName = RoutesNames.homePage;
    switch (selectedOptionNo) {
      case 2:
        routeName = RoutesNames.myCourseList;
        break;
      case 3:
        routeName = RoutesNames.whishlist;
        break;
      case 4:
        routeName = RoutesNames.profile;
        break;
    }
    Get.offNamed(routeName);
  }
}
