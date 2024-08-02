import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../constants.dart';
import '../../../../../../controller/auth/signup_controller.dart';
import '../../../../../../core/constant/color.dart';
import '../../../../../../core/functions/validinput.dart';
import '../../../../../Widget/auth/customtextformauth.dart';
import '../../../components/already_have_an_account_acheck.dart';
import '../../Login/login_screen.dart';

class SignUpForm extends GetView<SignUpControllerImp> {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formState,
      child: Column(
        children: [
          CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 5, 30, "username");
              },
              myController: controller.userName,
              hintText: "13".tr,
              label: "12".tr,
              icon: Icons.person_outline),
          CustomTextFormAuth(
              isNumber: false,
              valid: (val) {
                return validInput(val!, 5, 30, "email");
              },
              myController: controller.email,
              hintText: "4".tr,
              label: "5".tr,
              icon: Icons.email_outlined),
          GetBuilder<SignUpControllerImp>(
            builder: (controller) => CustomTextFormAuth(
                obscureText: controller.isShoowpass,
                onTapIcon: () {
                  controller.shoowPassword();
                },
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 5, 30, "password");
                },
                myController: controller.password,
                hintText: "7".tr,
                label: "6".tr,
                icon: Icons.lock_outline),
          ),
          // TextFormField(
          //   keyboardType: TextInputType.emailAddress,
          //   textInputAction: TextInputAction.next,
          //   cursorColor: kPrimaryColor,
          //   onSaved: (email) {},
          //   decoration: const InputDecoration(
          //     hintText: "Your email",
          //     prefixIcon: Padding(
          //       padding: EdgeInsets.all(defaultPadding),
          //       child: Icon(Icons.person),
          //     ),
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          //   child: TextFormField(
          //     textInputAction: TextInputAction.done,
          //     obscureText: true,
          //     cursorColor: kPrimaryColor,
          //     decoration: InputDecoration(
          //       hintText: "Your password",
          //       prefixIcon: Padding(
          //         padding: const EdgeInsets.all(defaultPadding),
          //         child: Icon(Icons.lock),
          //       ),
          //     ),
          //   ),
          // ),
          const SizedBox(height: defaultPadding / 2),
          MaterialButton(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            color: AppColor.kPrimaryColor,
            onPressed: () {
              controller.signUp();
            },
            child: Text(
              "Sign Up".toUpperCase(),
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return Login();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
