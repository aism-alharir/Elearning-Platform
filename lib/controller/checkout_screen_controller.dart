import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/checkout_data.dart';
import 'package:e_learningplatform/data/model/course_model.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class CheckoutScreenController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  CheckoutData checkoutData = Get.put(CheckoutData(Get.find()));
  MyServices myServices = Get.find();
  late CourseModel courseModel;
  String? paymentMethod;

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  checkout(String priceOrders, String courseid) async {
    if (paymentMethod == null) {
      return Get.snackbar("Error", "Please select a payment method");
    }

    statusRequest = StatusRequest.loading;
    update();
    // Map data = {
    //   "usersid": myServices.sharedPreferences.getString("id"),
    //   "addressid": addressid.toString(),
    //   "orderstype": deliveryType.toString(),
    //   "pricedelivery": "10",
    //   "ordersprice": priceOrders,
    //   "couponid": couponid,
    //   "coupondiscount": coupondiscount.toString(),
    //   "paymentmethod": paymentMethod.toString(),
    // };
    var response = await checkoutData.checkout(
      priceOrders,
      paymentMethod!,
      myServices.sharedPreferences.getString("id")!,
      courseid,
    );
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      Get.offAllNamed(RoutesNames.homePage);
      Get.snackbar("Success", "the order was successfuly");
    } else {
      statusRequest = StatusRequest.none;
      Get.snackbar("already enrolled ", "try again");
    }

    update();
  }

  @override
  void onInit() {
    courseModel = Get.arguments['courseModel'];

    // courseList = Get.arguments['cartCourseList'];
    // totalPrice = Get.arguments['totalAmount'];
    super.onInit();
  }

  // initialData() async {
  //   courseList = Get.arguments['courseList'];
  //   totalPrice = Get.arguments['totalPrice'];

  // }
}
