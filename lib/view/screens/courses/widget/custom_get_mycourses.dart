// import 'package:e_learningplatform/controller/my_course_controller.dart';
// import 'package:e_learningplatform/data/model/mycoursemodel.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class CustomGetMyCourses extends GetView<MyCourseController> {
//   final MyCourseModel myCourseModel;
//   const CustomGetMyCourses({super.key,required this.myCourseModel});

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Card(
//         child: ListTile(
//           leading: Image.network(
//              "${myCourseModel.course!.image}" ,
//             width: 90,
//           ),
//           title: Text(
//             "${myCourseModel.course!.title}",
//             style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
//           ),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "${myCourseModel.course!.instructor}",
//                 style: TextStyle(color: Colors.grey.shade500),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               // Visibility(
//               //     visible: myCourse.progress > 0,
//               //     replacement: const Text(
//               //       "Start Course",
//               //       style: TextStyle(
//               //           color: AppColor.kBlueColor,
//               //           fontWeight: FontWeight.bold),
//               //     ),
//               //     child: Row(
//               //       children: [
//               //         Expanded(
//               //           child: SliderTheme(
//               //             data: SliderThemeData(
//               //               trackHeight: 3,
//               //               thumbColor: Colors.transparent,
//               //               overlayShape: SliderComponentShape.noThumb,
//               //               thumbShape: SliderComponentShape.noThumb,
//               //             ),
//               //             child: Slider(
//               //               min: 0,
//               //               max: 100,
//               //               value: myCourse.progress.toDouble(),
//               //               onChanged: (value) {},
//               //             ),
//               //           ),
//               //         ),
//               //         const SizedBox(
//               //           width: 10,
//               //         ),
//               //         Text("${myCourse.progress}%")
//               //       ],
//               //     ),),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
