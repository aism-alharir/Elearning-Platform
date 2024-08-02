import 'package:e_learningplatform/arguments/checkout_argument.dart';
import 'package:e_learningplatform/controller/shopping_cart_screen_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/datasource/static/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learningplatform/data/model/course.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({super.key});

  @override
  State<ShoppingCartScreen> createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  @override
  Widget build(BuildContext context) {
    ShoppingCartScreenController controller =
        Get.put(ShoppingCartScreenController());
    // double totalAmount = calculateTotal();
    // List<Course> cartCourseList =
    //     ShoppingCartDataProvider.shoppingCartCourseList;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const Text("Shopping Cart")),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Text(
                          "Total :",
                          style: TextStyle(
                              fontSize: 20, color: Colors.grey.shade700),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          "\$${controller.totalAmount}",
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "Promotion",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 300,
                        height: 50,
                        child: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Enter Promo Code",
                            filled: true,
                            isDense: true,
                            contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: AppColor.kPrimaryColor),
                            child: const Text("Apply")),
                      ),
                    ],
                  ),
                  Text(
                    "${controller.cartCourseList.length} Courses in List",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade900),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.cartCourseList.length,
                      itemBuilder: (context, index) {
                        return createShoppingCartItems(index);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                width: double.infinity,
                margin: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.kPrimaryColor,
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () {
                      controller.goToCheckOut(
                          controller.cartCourseList, controller.totalAmount);
                      // Get.toNamed(RoutesNames.checkout,
                      //     arguments:
                      //         CheckoutArgument(cartCourseList, totalAmount));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                      child: Text(
                        "Checkout",
                        style: TextStyle(fontSize: 20),
                      ),
                    )),
              ),
            ],
          )),
    );
  }

  // calculate total price for shopping Cart

  // double calculateTotal() {
  //   return ShoppingCartDataProvider.shoppingCartCourseList
  //       .fold(0, (old, course) => old + course.price);
  // }

  //write function to create shopping cart items
  Widget createShoppingCartItems(int index) {
    Course course = ShoppingCartDataProvider.shoppingCartCourseList[index];
    return Card(
      child: ListTile(
        leading: Image.asset(
          course.thumbnailUrl,
          width: 80,
        ),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "By ${course.createdBy}",
              style: const TextStyle(fontSize: 13, color: AppColor.kBlueColor),
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
                const SizedBox(
                  width: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 3,
                  child: Container(),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
                ),
              ],
            ),
          ],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("\$${course.price}"),
            InkWell(
              onTap: () {
                setState(() {
                  ShoppingCartDataProvider.deleteCourse(course);
                });
              },
              child: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
