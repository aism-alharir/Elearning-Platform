
import 'package:e_learningplatform/controller/auth/successresetpasswordlogin_cotroller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/view/Widget/auth/custombuttonauth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordLoginControllerImp controller =
        Get.put(SuccessResetPasswordLoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "29".tr,
          style: Theme.of(context)
              .textTheme
              .displayLarge
              ?.copyWith(color: AppColor.grey),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: AppColor.kPrimaryColor,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Center(
                child: Icon(
              Icons.check_circle_outline,
              size: 200,
              color: AppColor.primaryColor,
            )),
            Text("31".tr, style: Theme.of(context).textTheme.bodyLarge),
            const Spacer(),
            SizedBox(
                width: double.infinity,
                child: CustomButtonAuth(
                  text: "32".tr,
                  onPressed: () {
                    controller.goToPageLogin();
                  },
                )),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
