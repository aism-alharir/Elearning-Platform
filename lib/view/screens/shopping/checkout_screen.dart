import 'package:csc_picker/csc_picker.dart';
import 'package:e_learningplatform/controller/checkout_screen_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:e_learningplatform/util/util.dart';
import 'package:e_learningplatform/view/screens/shopping/widget/card_payment%20_method.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(CheckoutScreenController());
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const Text("Checkout"),
        ),
        body: GetBuilder<CheckoutScreenController>(
          builder: (controller) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Billing Address",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CSCPicker(
                      layout: Layout.vertical,
                      flagState: CountryFlag.ENABLE,
                      onCountryChanged: (value) {},
                      onStateChanged: (value) {},
                      onCityChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const PaymentMethod(),
                    // InkWell(
                    //     onTap: () {
                    //       controller.choosePaymentMethod("0"); //cash
                    //     },
                    //     child: CardPaymentMethodCheckout(
                    //         title: "Cash",
                    //         isActive: controller.paymentMethod == "0"
                    //             ? true
                    //             : false)),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    InkWell(
                      onTap: () {
                        controller.choosePaymentMethod("1"); // payment mehod
                      },
                      child: CardPaymentMethodCheckout(
                          title: "Payment Cards",
                          isActive:
                              controller.paymentMethod == "1" ? true : false),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Order",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                        child: ListTile(
                      leading: Image.network(
                        "${controller.courseModel.image}",
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        "${controller.courseModel.title}",
                        style: const TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                      trailing: Text("\$${controller.courseModel.price}"),
                    )),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${controller.courseModel.price}",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.bold),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          controller.checkout(
                              controller.courseModel.price.toString(),
                              controller.courseModel.id.toString());

                          // MyCourseDataProvider.addAllCourse(
                          //     controller.courseList);
                          // ShoppingCartDataProvider.clearCart();
                          Util.showMessage(
                              context, "Your Order is  Placed Successfully");

                          Get.toNamed(RoutesNames.homePage);
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.kPrimaryColor),
                        child: const Text(
                          "Place Order",
                          style: TextStyle(fontSize: 20),
                        )),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
