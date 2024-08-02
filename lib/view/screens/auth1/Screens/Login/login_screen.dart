import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../controller/auth/login_controller.dart';
import '../../../../../core/class/handlingdataview.dart';
import '../../../../../responsive.dart';
import '../../components/background.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginCotrollerImp());
    return Background(
        child: GetBuilder<LoginCotrollerImp>(
      builder: (controller) => HandlingDataRequest(
        statusRequest: controller.statusRequest,
        widget: const SingleChildScrollView(
          child: Responsive(
            mobile: MobileLoginScreen(),
            desktop: Row(
              children: [
                Expanded(
                  child: LoginScreenTopImage(),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 450,
                        child: LoginForm(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        LoginScreenTopImage(),
        Row(
          children: [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
