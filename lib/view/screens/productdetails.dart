import 'package:e_learningplatform/controller/productdetails_controller.dart';
import 'package:e_learningplatform/core/class/handlingdataview.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/view/Widget/productdetails/custompriceand%20count.dart';
import 'package:e_learningplatform/view/Widget/productdetails/customtoppageproductdetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/productdetails/customsubitemslist.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    return Scaffold(
        bottomNavigationBar: Container(
          height: 40,
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primaryColor),
          child: MaterialButton(
              onPressed: () {
                // Get.toNamed(AppRoutes.cart);
              },
              child: const Text(
                "Go To Cart",
                style: TextStyle(fontSize: 15, color: Colors.white),
              )),
        ),
        body: GetBuilder<ProductDetailsControllerImp>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                const CustomTopPageProductDetails(),
                const SizedBox(
                  height: 100,
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${controller.courseModel.title}",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomPriceAndcount(
                          onAdd: () {
                            controller.add();
                          },
                          onRemove: () {
                            controller.remove();
                          },
                          count: "${controller.countItems}",
                          price: "${controller.courseModel.title}"),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.courseModel.description} ",
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Color",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.fourthColor),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const CustomSubItemsList(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
