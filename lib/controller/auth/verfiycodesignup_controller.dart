
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

abstract class VerFiyCodeSignUp_Controller extends GetxController {
  cheekCode();
  goToSuccessSignUp();
}

class VerFiyCodeSignUp_ControllerImp extends VerFiyCodeSignUp_Controller {
  @override
  goToSuccessSignUp() {
    Get.offNamed(RoutesNames.successSignUp);
  }

  @override
  cheekCode() {}
}
