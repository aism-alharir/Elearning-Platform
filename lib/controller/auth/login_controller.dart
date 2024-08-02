import 'dart:convert';

import 'package:e_learningplatform/core/class/statusrequest.dart';
import 'package:e_learningplatform/core/functions/handlingdatacontroller.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:e_learningplatform/data/datasource/remote/auth/login.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

abstract class LoginController extends GetxController {
  login();
  goToSignUP();
  goToForegetPassword();
}

class LoginCotrollerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController userName;
  late TextEditingController password;

  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();
  StatusRequest statusRequest = StatusRequest.none;
  bool isShoowpass = true;
  shoowPassword() {
    isShoowpass = isShoowpass == true ? false : true;
    update();
  }

  @override
  goToSignUP() {
    Get.offNamed(RoutesNames.singUp);
  }

  @override
  login() async {
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(userName.text, password.text);
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        myServices.sharedPreferences
            .setString("id", response['id'].toString());
        myServices.sharedPreferences
            .setString("username", response['username']);
        myServices.sharedPreferences
            .setString("email", response['email']);
        myServices.sharedPreferences
            .setString("first_name", response['first_name']);
        myServices.sharedPreferences.setString('step', "2");
        Get.offNamed(RoutesNames.homePage);
        // if (response['status'] == "success") {
        //   // Get.offNamed(AppRoutes.homePage);
        //   myServices.sharedPreferences
        //       .setString("id", response['data']['users_id'].toString());
        //   myServices.sharedPreferences
        //       .setString("username", response['data']['users_name']);
        //   myServices.sharedPreferences
        //       .setString("email", response['data']['users_email']);
        //   myServices.sharedPreferences
        //       .setString("phone", response['data']['users_phone']);
        //   myServices.sharedPreferences.setString('step', "2");
        //   Get.offNamed(RoutesNames.homePage);
        // } else {
        //   Get.defaultDialog(title: "44".tr, middleText: "45".tr);
        //   statusRequest = StatusRequest.failure;
        // }
      } else {
        Get.defaultDialog(title: "44".tr, middleText: "45".tr);
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  void onInit() {
    userName = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    userName.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForegetPassword() {
    Get.toNamed(RoutesNames.forgetPassword);
  }


  //  final TextEditingController _usernameController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  // // final FlutterSecureStorage _storage = FlutterSecureStorage();

  // Future<void> _login() async {
  //   final String username = _usernameController.text;
  //   final String password = _passwordController.text;

  //   final response = await http.post(
  //     'https://api.example.com/login', // Replace with the Digngo API login endpoint
  //     body: jsonEncode({'username': username, 'password': password}),
  //     headers: {'Content-Type': 'application/json'},
  //   );

  //   if (response.statusCode == 200) {
  //     // Login successful
  //     final authToken = jsonDecode(response.body)['token'];

  //     // Store the token securely
  //     await _storage.write(key: 'authToken', value: authToken);

  //     // Move to the next screen or perform other actions
  //     // e.g., Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     // Login failed
  //     final error = jsonDecode(response.body)['error'];

  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Login Failed'),
  //         content: Text(error),
  //         actions: <Widget>[
  //           TextButton(
  //             child: Text('OK'),
  //             onPressed: () => Navigator.pop(context),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }
  



}
