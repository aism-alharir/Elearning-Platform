
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

abstract class SuccessResetPasswordLoginController extends GetxController {
  goToPageLogin();
}

class SuccessResetPasswordLoginControllerImp extends SuccessResetPasswordLoginController {
  @override
  goToPageLogin() {
    Get.offAllNamed(RoutesNames.login);
  }
}
