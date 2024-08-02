import 'package:get/get.dart';
import '../../../util/routes_names.dart';

myBackComment() {
  Get.offAllNamed(RoutesNames.myCourseList);
  return Future.value(false);
}

myBackPost() {
  Get.offAllNamed(RoutesNames.myCourseList);
  return Future.value(false);
}
