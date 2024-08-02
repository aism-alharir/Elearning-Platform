// import 'package:get/get.dart';
// import '../../data/model/course.dart';

// class CourseDetailsCotroller extends GetxController {
//   bool isFavorite = false;
//   late Course course;

//   changeSelctedFavorite() {
//     isFavorite = !isFavorite;
//     widget.course.isFavorite = isFavorite;
//     update();
//   }

//   @override
//   void onInit() {
//     isFavorite = course.isFavorite;
//     super.onInit();
//   }
// }
import 'package:e_learningplatform/data/model/course.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class CourseDetailsController extends GetxController {
  late Course course;
  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() {
    course = Get.arguments['course'];
  }

  goTOPageCheckOut(courseList, totalPrice) {
    Get.toNamed(RoutesNames.checkout,
        arguments: {"courseList": courseList, "totalPrice": totalPrice});
  }

  goToShopping(course) {
    Get.toNamed(RoutesNames.shoppingCart,
    arguments: {"course" : course}
    );
  }
}
