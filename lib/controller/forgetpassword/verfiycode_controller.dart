
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:get/get.dart';

abstract class VerFiyCode_Controller extends GetxController {
  cheekCode();
  goToResetPassword();
}

class VerFiyCode_ControllerImp extends VerFiyCode_Controller {
  @override
  goToResetPassword() {
    Get.offNamed(RoutesNames.resetPassword);
    throw UnimplementedError();
  }

  @override
  cheekCode() {
    throw UnimplementedError();
  }


}
