import 'package:e_learningplatform/controller/productdetails_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/view/screens/deteails/widget/favorite_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(ProductDetailsControllerImp());
    var greyTextStyle = TextStyle(fontSize: 15, color: Colors.grey.shade800);
    return Scaffold(
      body: SafeArea(
          child: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: IconButton(
                              onPressed: () {
                                Get.back();
                                // Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back),
                              color: AppColor.kPrimaryColor,
                              // color: Colors.grey.shade800,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 90.3),
                            child: Text(
                              "Course Details",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: AppColor.kPrimaryColor),
                            ),
                          )
                          // Row(
                          //   children: [
                          //     Padding(
                          //       padding: const EdgeInsets.all(4.0),
                          //       child: IconButton(
                          //           onPressed: () {},
                          //           icon: const Icon(Icons.share),
                          //           color: Colors.grey.shade800),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.all(4.0),
                          //       child: IconButton(
                          //           onPressed: () {
                          //             // controller.goToShopping(controller.course);
                          //             // Get.toNamed(RoutesNames.shoppingCart);
                          //           },
                          //           icon: const Icon(Icons.shopping_cart),
                          //           color: Colors.grey.shade800),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              "${controller.courseModel.image}",
                              height: 200,
                              width: double.infinity,
                              fit: BoxFit.fill,
                            ),
                          ),
                          const Column(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                size: 90,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Preview this course",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${controller.courseModel.title}",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade800)),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      color: AppColor.kBlueColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${controller.courseModel.instructor!.username}",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          color: AppColor.kBlueColor),
                                    )
                                  ],
                                ),
                                FavoriteOption(
                                    courseModel: controller.courseModel),
                              ],
                            ),
                            Row(
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.play_circle_outline),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // Text(
                                    //   "${controller.courseModel.lessonNo} Lessons",
                                    //   style: greyTextStyle,
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.access_time),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // Text(
                                    //   controller.course.duration,
                                    //   style: greyTextStyle,
                                    // ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      size: 25,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "${controller.courseModel.rate}",
                                      style: greyTextStyle,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ReadMoreText(
                              "${controller.courseModel.description}",
                              trimLines: 2,
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              moreStyle: const TextStyle(
                                  color: AppColor.kBlueColor,
                                  fontWeight: FontWeight.bold),
                              lessStyle: const TextStyle(
                                  color: AppColor.kBlueColor,
                                  fontWeight: FontWeight.bold),
                              style: TextStyle(
                                fontSize: 17,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Course Countent",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(
                                //   "${controller.courseModel.section.length} Sections",
                                //   style: TextStyle(
                                //       fontSize: 16,
                                //       color: Colors.grey.shade700),
                                // )
                              ],
                            ),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemCount: controller.courseModel.section.length,
                            //   itemBuilder: (context, index) {
                            //     return BuildCourseContent(index: index);
                            //   },
                            // )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 60,
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 5),
              child: Card(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          "\$${controller.courseModel.price}",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            height: 1.2,
                            fontSize: 30,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          // ElevatedButton(
                          //     style: ElevatedButton.styleFrom(
                          //         primary: AppColor.kPrimaryColor),
                          //     onPressed: () {
                          //       String message =
                          //           "Course is alrede added into cart";
                          //       if (!ShoppingCartDataProvider
                          //           .shoppingCartCourseList
                          //           .contains(controller.course)) {
                          //         message = "Course is added into cart";
                          //         ShoppingCartDataProvider.addCourse(
                          //             controller.course);
                          //       }
                          //       Util.showMessageWithActioon(
                          //           context, message, "View", () {
                          //         Util.openShoppingCart(context);
                          //       });
                          //     },
                          //     child: const Text(
                          //       "Add to Cart",
                          //       style: TextStyle(fontSize: 20),
                          //     )),
                          const SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: AppColor.kPrimaryColor),
                              onPressed: () {
                                controller
                                    .goTOPageCheckOut(controller.courseModel);
                                // Get.toNamed(RoutesNames.checkout,
                                //     arguments:
                                //         CheckoutArgument([course], course.price));
                              },
                              child: const Text(
                                "Buy",
                                style: TextStyle(fontSize: 20),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

//   Widget buildCourseContent(int index) {
//     Section section = course.section[index];
//     return ExpansionTile(
//       title: Text(
//         "Section ${index + 1} - ${section.name}",
//         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//       ),
//       children: section.lecture.map((lecture) {
//         return ListTile(
//           dense: true,
//           onTap: () {},
//           leading: const SizedBox(),
//           title: Text(lecture.name),
//           subtitle: Row(
//             children: [
//               const Icon(
//                 Icons.access_time,
//                 size: 15,
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               Text(
//                 lecture.duration,
//                 style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
//               ),
//             ],
//           ),
//         );
//       }).toList(),
//     );
//   }
// }
