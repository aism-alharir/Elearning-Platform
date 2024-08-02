import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/view/screens/drawer/home_page.dart';
import 'package:get/get.dart';




class ControllerProfile extends GetxController {
  late String firstname;
  late String email;
  // late String gender;
  MyServices myServices = Get.find();
  late String username;

  // late DateTime agebirthday = DateTime.parse(birthday);
  // late DateTime currentDate;
  // String calcage() {
  //   String age = (currentDate.year - agebirthday.year).toString();
  //   return age;
  // }

  String? r;
  @override
  void onInit() {
    username = myServices.sharedPreferences.getString("username")!;
    email = myServices.sharedPreferences.getString("email")!;
    firstname = myServices.sharedPreferences.getString("first_name")!;
    // gender = myServices.sharedPreferences.getString("gender")!;
    // currentDate = DateTime.now();
    // r = calcage();
    // print(r);
    // myServices.sharedPreferences.setString("age", r.toString());
    super.onInit();
  }

  Singout() {
    // myServices.sharedPreferences.remove("id");
    // myServices.sharedPreferences.remove("username");
    // myServices.sharedPreferences.remove("email");
    // myServices.sharedPreferences.remove("first_name");
    // // myServices.sharedPreferences.remove("gender");
    // // myServices.sharedPreferences.remove("age");
    Get.offAll(() => HomePage());
  }
}