import 'package:get/get.dart';
import '../../../util/routes_names.dart';

myBackHomePage() {
  Get.offAllNamed(RoutesNames.homePage);
  return Future.value(false);
}
