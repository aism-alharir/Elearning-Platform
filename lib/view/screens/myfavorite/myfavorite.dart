import 'package:e_learningplatform/component/bottom_option.dart';
import 'package:e_learningplatform/controller/myfavorite_controller%20copy.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/view/screens/myfavorite/widget/customlistfavorieitems.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color.dart';

class MyFavorite extends StatelessWidget {
  const MyFavorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyFavoriteController());
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GetBuilder<MyFavoriteController>(
          builder: (controller) => ListView(
            children: [
              // CustomAppBar(
              //   titleappbar: "49".tr,
              //   onPressedSearch: () {},
              //   onPressedIconFavorite: () {},
              // ),
              const Center(
                child: Text(
                  "My Favorte",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.data.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 0.7),
                  itemBuilder: (context, index) {
                    return CustomListFavoriteItems(
                        itemsModel: controller.data[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: const ShoppingCartOption(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
       bottomNavigationBar: const BottomOption(slecetedIndex: 3),
    );
  }
}
