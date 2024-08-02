import 'package:e_learningplatform/component/bottom_option.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/view/screens/home/widget/course_search.dart';
import 'package:e_learningplatform/view/screens/home/widget/customlistcategorieshome.dart';
import 'package:e_learningplatform/view/screens/home/widget/customtitlehome.dart';
import 'package:e_learningplatform/view/screens/home/widget/header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/home/course_home_controller.dart';
import '../../../responsive.dart';
import 'widget/imagesAnimation.dart';

class CourseHome extends StatelessWidget {
  const CourseHome({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CourseHomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: GetBuilder<CourseHomeController>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: SingleChildScrollView(
                    child: Responsive(
                      mobile: Column(
                        children: [
                          Container(
                              height: 240,
                              decoration: const BoxDecoration(
                                  color: AppColor.kPrimaryColor,
                                  // color: Colors.grey,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25))),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 1,
                                    ),
                                    Header(),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    CourseSearch(),
                                  ],
                                ),
                              )),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Offers(
                                //   onPageChanged: (selectedPage) {
                                //     controller.changeSelectedPage(selectedPage);
                                //   },
                                // ),
                                Offer2(),
                                const SizedBox(
                                  height: 24,
                                ),
                                CustomTitleHome(title: "52".tr),
                                const CustomListCategoriesHome(),
                                const SizedBox(
                                  height: 80,
                                ),
                                // const FeaturedCourses(),
                                // const CategoryCourseList(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )))),
      // floatingActionButton: const ShoppingCartOption(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(
        slecetedIndex: 1,
      ),
    );
  }
}
