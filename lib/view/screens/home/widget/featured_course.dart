// import 'package:e_learningplatform/controller/home/course_home_controller.dart';
// import 'package:e_learningplatform/core/constant/color.dart';
// import 'package:e_learningplatform/data/model/course.dart';
// import 'package:e_learningplatform/data/model/course_model.dart';
// import 'package:e_learningplatform/linkapi.dart';
// import 'package:e_learningplatform/view/screens/home/widget/course_item.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class FeaturedCourses extends GetView<CourseHomeController> {
//   const FeaturedCourses({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // CourseHomeController controller = Get.put(CourseHomeController());
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "Featured Courses",
//               style: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.grey.shade800,
//               ),
//             ),
//             InkWell(
//               onTap: () {},
//               child: const Text(
//                 "See All",
//                 style: TextStyle(color: Colors.blue, fontSize: 15),
//               ),
//             )
//           ],
//         ),
//         const SizedBox(
//           height: 10,
//         ),
//         SizedBox(
//           height: 220,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: controller.courseItems.length,
//             // itemCount: controller.featuredCourseList.length,
//             itemBuilder: (context, index) {
//               // CourseModel course = controller.courseItems[index];
//               return CourseItem(course: controller.courseItems[index]);
//             },
//           ),
//         )
//       ],
//     );
//   }
// }

// class CourseItem extends StatelessWidget {
//   final CourseModel course;
//   const CourseItem({super.key, required this.course});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: 200,
//       child: Padding(
//         padding: const EdgeInsets.all(1),
//         child: Card(
//           clipBehavior: Clip.antiAlias,
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: InkWell(
//             onTap: () {
//               // controller.goTOPageProductDetails(course);
//               // Get.toNamed(RoutesNames.courseDetails,
//               //     arguments: CoursesArgument(course));
//               // Navigator.pushNamed(context, RoutesNames.courseDetails,
//               //     arguments: CoursesArgument(course));
//             },
//             child: ListView(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 children: [
//                   Image.network(
//                     "${course.image}",
//                     height: 110,
//                     fit: BoxFit.fill,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "${course.title}",
//                           style: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey.shade800,
//                           ),
//                         ),
//                         const SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           children: [
//                             const Icon(
//                               Icons.person,
//                               size: 20,
//                               color: AppColor.kBlueColor,
//                             ),
//                             const SizedBox(
//                               width: 7,
//                             ),
//                             Text(
//                               "${course.instructor}",
//                               style: const TextStyle(
//                                   fontSize: 12, color: AppColor.kBlueColor),
//                             )
//                           ],
//                         ),
//                         const SizedBox(
//                           height: 5,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Row(
//                               children: [
//                                 const Icon(
//                                   Icons.star,
//                                   size: 20,
//                                   color: AppColor.kRatingColor,
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 Text(
//                                   "${course.rate}",
//                                   style: const TextStyle(fontSize: 15),
//                                 )
//                               ],
//                             ),
//                             Text(
//                               "\$${course.price}",
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.grey.shade800),
//                             )
//                           ],
//                         )
//                       ],
//                     ),
//                   )
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
