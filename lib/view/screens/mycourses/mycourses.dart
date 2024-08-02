import 'package:e_learningplatform/component/bottom_option.dart';
import 'package:e_learningplatform/controller/myCourses/my_course_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/view/screens/mycourses/widget/custom_get_mycourses.dart';


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyCourseController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyCourseController>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: "49".tr,
              //   onPressedSearch: () {},
              //   onPressedIconFavorite: () {},
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "My Course",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade900),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  itemBuilder: (context, index) {
                    return CustomGetMyCourses(
                      myCourseModel: controller.data[index],
                    );
                  },
                ),
              ),
              // HandlingDataView(
              //   statusRequest: controller.statusRequest,
              //   widget: GridView.builder(
              //     shrinkWrap: true,
              //     physics: const NeverScrollableScrollPhysics(),
              //     itemCount: controller.data.length,
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2, childAspectRatio: 0.7),
              //     itemBuilder: (context, index) {
              //       return CustomListShowCourses(
              //         itemsModel: controller.data[index],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
      // floatingActionButton: const ShoppingCartOption(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const BottomOption(slecetedIndex: 2),
    );
  }
}
