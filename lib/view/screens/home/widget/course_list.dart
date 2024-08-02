// import 'package:e_learningplatform/controller/home/course_home_controller.dart';
// import 'package:e_learningplatform/data/datasource/static/data_provider/course_data_provider.dart';
// import 'package:e_learningplatform/data/model/course.dart';
// import 'package:e_learningplatform/data/model/course_category.dart';
// import 'package:e_learningplatform/view/notifier/course_category_change_notifer.dart';
// import 'package:e_learningplatform/view/screens/home/widget/course_item.dart';
// import 'package:e_learningplatform/view/screens/home/widget/featured_course.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:provider/provider.dart';

// class CourseList extends GetView<CourseHomeController> {
//   const CourseList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GridView.count(
//       crossAxisCount: 2,
//       shrinkWrap: true,
//       physics: const ScrollPhysics(),
//       children: getCourseList(context).map((course) {
//         return CourseItem(course: course);
//       }).toList(),
//     );
//   }

//   List<Course> getCourseList(BuildContext context) {
//     var category = Provider.of<CourseCategoryChangeNotifier>(context).category;

//     if (category == CourseCategory.all) {
//       return CourseDataProvider.courseList;
//     }
//     return CourseDataProvider.courseList
//         .where((course) => course.courseCategory == category)
//         .toList();
//   }
// }
