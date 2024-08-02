import 'package:e_learningplatform/data/datasource/static/data_provider/shopping_cart_data_provider.dart';
import 'package:e_learningplatform/data/model/course.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class ShoppingCartScreenController extends GetxController {
  late double totalAmount;
  late List<Course> cartCourseList;
  late Course course;

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  initialData() async {
    cartCourseList = ShoppingCartDataProvider.shoppingCartCourseList;
    totalAmount = calculateTotal();
    course = Get.arguments['course'];
  }

  double calculateTotal() {
    return ShoppingCartDataProvider.shoppingCartCourseList
        .fold(0, (old, course) => old + course.price);
  }

  goToCheckOut( cartCourseList, totalAmount) {
    Get.toNamed(
      RoutesNames.checkout,
      arguments: {
        "cartCourseList": cartCourseList,
        "totalAmount" : totalAmount
      }
    );
  }

  deleteCourseFromShopping() {
    ShoppingCartDataProvider.deleteCourse(course);
    update();
  }
}
