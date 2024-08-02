// import 'package:e_learningplatform/core/constant/color.dart';
// import 'package:e_learningplatform/data/datasource/static/data_provider/course_data_provider.dart';
// import 'package:e_learningplatform/data/model/course.dart';
// import 'package:flutter/material.dart';

// class WhishList extends StatefulWidget {
//   const WhishList({super.key});

//   @override
//   State<WhishList> createState() => _WhishListState();
// }

// class _WhishListState extends State<WhishList> {
//   @override
//   Widget build(BuildContext context) {
//     List<Course> courseList = getCourseList(context);
//     return ListView.builder(
//       shrinkWrap: true,
//       itemCount: courseList.length,
//       itemBuilder: (context, index) {
//         Course course = courseList[index];
//         return getListItems(course);
//       },
//     );
//   }

//   List<Course> getCourseList(BuildContext context) {
//     return CourseDataProvider.courseList
//         .where((course) => course.isFavorite)
//         .toList();
//   }

//   Widget getListItems(Course course) {
//     return Card(
//       child: ListTile(
//         leading: Image.asset(
//           course.thumbnailUrl,
//           width: 70,
//         ),
//         title: Text(
//           course.title,
//           maxLines: 2,
//           style: TextStyle(fontSize: 17, color: Colors.grey.shade800),
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               "By ${course.createdBy}",
//               style: const TextStyle(fontSize: 13, color: AppColor.kBlueColor),
//             ),
//             Row(
//               children: [
//                 Text(
//                   course.duration,
//                   style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 CircleAvatar(
//                   radius: 3,
//                   backgroundColor: Colors.grey,
//                   child: Container(),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Text(
//                   "${course.lessonNo} Lessons",
//                   style: TextStyle(fontSize: 14, color: Colors.grey.shade500),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 CircleAvatar(
//                   radius: 3,
//                   backgroundColor: Colors.grey,
//                   child: Container(),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                 ),
//                 Row(
//                   children: [
//                     const Icon(
//                       Icons.star,
//                       color: Colors.yellow,
//                     ),
//                     const SizedBox(
//                       width: 10,
//                     ),
//                     Text("${course.rate}"),
//                   ],
//                 ),
//               ],
//             ),
//             Row(
//               children: [
//                 Text(
//                   "\$${course.price}",
//                   style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.grey.shade800,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 InkWell(
//                     onTap: () {
//                       setState(() {
//                         course.isFavorite = false;
//                       });
//                     },
//                     child: const Icon(Icons.delete)),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
