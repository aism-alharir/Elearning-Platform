import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

class SettingAccountController extends GetxController {
  MyServices myServices = Get.find();
  logout() {
    myServices.sharedPreferences.clear();
    Get.offAllNamed(RoutesNames.login);
  }
}
