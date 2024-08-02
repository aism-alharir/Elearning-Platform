// import 'package:e_learningplatform/component/bottom_option.dart';
// import 'package:e_learningplatform/component/shopping_cart_option.dart';
// import 'package:e_learningplatform/controller/my_course_controller.dart';
// import 'package:e_learningplatform/core/class/handlingdataview.dart';
// import 'package:e_learningplatform/core/constant/color.dart';
// import 'package:e_learningplatform/view/screens/courses/widget/custom_get_mycourses.dart';

// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class MyCourseList extends StatelessWidget {
//   const MyCourseList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // List<MyCourse> myCourseList = MyCourseDataProvider.myCourses;
//     // if (myCourseList.isNotEmpty) {
//     //   myCourseList[0].progress = 50;
//     //   // myCourseList[1].progress = 20;
//     // }
//     Get.put(MyCourseController);
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
          
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 "My Course",
//                 style: TextStyle(
//                     fontSize: 25,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey.shade900),
//               ),
//             ),
//             SizedBox(
//               height: 30,
//               child: ListView(
//                 scrollDirection: Axis.horizontal,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: AppColor.kPrimaryColor,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(color: Colors.grey.shade900)),
//                         // ignore: prefer_const_constructors
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: const Text(
//                             "All Course",
//                             style: TextStyle(color: Colors.white),
//                           ),
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(color: Colors.grey.shade900)),
//                         // ignore: prefer_const_constructors
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: const Text(
//                             "Downloaded Course",
//                           ),
//                         )),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 5),
//                     child: Container(
//                         alignment: Alignment.center,
//                         decoration: BoxDecoration(
//                             color: Colors.grey.shade200,
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(10)),
//                             border: Border.all(color: Colors.grey.shade900)),
//                         // ignore: prefer_const_constructors
//                         child: Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 10),
//                           child: const Text(
//                             "Archived Course",
//                           ),
//                         )),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
            
//                GetBuilder<MyCourseController>(
//                 builder: (controller) => HandlingDataView(
//                   statusRequest: controller.statusRequest,
//                   widget: ListView.builder(
//                     shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                     itemCount: controller.data.length,
//                     itemBuilder: (context, index) {
//                       return CustomGetMyCourses(
//                         myCourseModel: controller.data[index],
//                       );
//                     },
//                   ),
//                 ),
//               ),
            
//           ],
//         ),
//       ),
//       floatingActionButton: const ShoppingCartOption(),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       bottomNavigationBar: const BottomOption(slecetedIndex: 2),
//     );
//   }
// }



// // // //   Widget getMyCourse(MyCourse myCourse, BuildContext context) {
// // // //     return InkWell(
// // // //       onTap: () {},
// // // //       child: Card(
// // // //         child: ListTile(
// // // //           leading: Image.asset(
// // // //             myCourse.course.thumbnailUrl,
// // // //             width: 90,
// // // //           ),
// // // //           title: Text(
// // // //             myCourse.course.title,
// // // //             style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
// // // //           ),
// // // //           subtitle: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             children: [
// // // //               Text(
// // // //                 myCourse.course.createdBy,
// // // //                 style: TextStyle(color: Colors.grey.shade500),
// // // //               ),
// // // //               const SizedBox(
// // // //                 height: 10,
// // // //               ),
// // // //               Visibility(
// // // //                   visible: myCourse.progress > 0,
// // // //                   replacement: const Text(
// // // //                     "Start Course",
// // // //                     style: TextStyle(
// // // //                         color: AppColor.kBlueColor,
// // // //                         fontWeight: FontWeight.bold),
// // // //                   ),
// // // //                   child: Row(
// // // //                     children: [
// // // //                       Expanded(
// // // //                         child: SliderTheme(
// // // //                           data: SliderThemeData(
// // // //                             trackHeight: 3,
// // // //                             thumbColor: Colors.transparent,
// // // //                             overlayShape: SliderComponentShape.noThumb,
// // // //                             thumbShape: SliderComponentShape.noThumb,
// // // //                           ),
// // // //                           child: Slider(
// // // //                             min: 0,
// // // //                             max: 100,
// // // //                             value: myCourse.progress.toDouble(),
// // // //                             onChanged: (value) {},
// // // //                           ),
// // // //                         ),
// // // //                       ),
// // // //                       const SizedBox(
// // // //                         width: 10,
// // // //                       ),
// // // //                       Text("${myCourse.progress}%")
// // // //                     ],
// // // //                   ))
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // // }
