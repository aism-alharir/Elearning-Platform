// import 'dart:convert';
// import 'package:e_learningplatform/controller/auth/login_controller.dart';
// import 'package:e_learningplatform/core/class/handlingdataview.dart';
// import 'package:e_learningplatform/core/constant/color.dart';
// import 'package:e_learningplatform/core/functions/alertexitapp.dart';
// import 'package:e_learningplatform/core/functions/validinput.dart';
// import 'package:e_learningplatform/core/services/services.dart';
// import 'package:e_learningplatform/util/routes_names.dart';
// import 'package:e_learningplatform/view/Widget/auth/custombuttonauth.dart';
// import 'package:e_learningplatform/view/Widget/auth/customtextbodyauth.dart';
// import 'package:e_learningplatform/view/Widget/auth/customtextformauth.dart';
// import 'package:e_learningplatform/view/Widget/auth/customtextsignup.dart';
// import 'package:e_learningplatform/view/Widget/auth/customtexttitleauth.dart';
// import 'package:e_learningplatform/view/Widget/auth/logoauth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;

// class Login extends StatelessWidget {
//   // Login({Key? key}) : super(key: key);
//   // String linkUrl = 'http://192.168.8.100:9000/accounts/token/';
//   // final TextEditingController _usernameController = TextEditingController();
//   // final TextEditingController _passwordController = TextEditingController();
//   // // final FlutterSecureStorage _storage = FlutterSecureStorage();
//   // MyServices myServices = Get.find();
//   // GlobalKey<FormState> formState = GlobalKey<FormState>();

//   // Future<void> login1() async {
//   //   final String username = _usernameController.text;
//   //   final String password = _passwordController.text;

//   //   final response = await http.post(
//   //     Uri.parse(linkUrl),
//   //     // Replace with the Digngo API login endpoint
//   //     body: jsonEncode({'username': username, 'password': password}),
//   //     headers: {'Content-Type': 'application/json'},
//   //   );

//   //   if (response.statusCode == 200) {
//   //     // Login successful
//   //     final authToken = jsonDecode(response.body)['access'];

//   //     // Store the token securely
//   //     // await _storage.write(key: 'authToken', value: authToken);
//   //     await myServices.sharedPreferences.setString('authToken', authToken);
//   //     myServices.sharedPreferences.setString('step', "2");
//   //     Get.offNamed(RoutesNames.homePage);
//   //     // Move to the next screen or perform other actions
//   //     // e.g., Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
//   //   } else {
//   //     // Login failed
//   //     // final error = jsonDecode(response.body)['error'];
//   //     Get.defaultDialog(title: "44".tr, middleText: "45".tr);

//   //     // Get.defaultDialog(
//   //     //   title: 'Login Failed',
//   //     //   content: Text(error),
//   //     //   actions: <Widget>[
//   //     //     TextButton(
//   //     //       child: Text('OK'),
//   //     //       onPressed: () => Get.back(),
//   //     //     ),
//   //     //   ],
//   //     // );

//   //     // showDialog(
//   //     //   context: context,
//   //     //   builder: (context) => AlertDialog(
//   //     //     title: Text('Login Failed'),
//   //     //     content: Text(error),
//   //     //     actions: <Widget>[
//   //     //       TextButton(
//   //     //         child: Text('OK'),
//   //     //         onPressed: () => Navigator.pop(context),
//   //     //       ),
//   //     //     ],
//   //     //   ),
//   //     // );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     Get.put(LoginCotrollerImp());
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "9".tr,
//             style: Theme.of(context)
//                 .textTheme
//                 .displayLarge
//                 ?.copyWith(color: AppColor.grey),
//           ),
//           centerTitle: true,
//           elevation: 0.0,
//           backgroundColor: AppColor.kPrimaryColor,
//         ),
//         body: WillPopScope(
//           onWillPop: AlertExitApp,
//           child: GetBuilder<LoginCotrollerImp>(
//               builder: ((controller) => HandlingDataRequest(
//                   statusRequest: controller.statusRequest,
//                   widget: Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 15, horizontal: 15),
//                     child: Form(
//                       key: controller.formState,
//                       child: ListView(
//                         children: [
//                           const Logo(),
//                           CustomTextTitleAuth(textTitle: "2".tr),
//                           const SizedBox(
//                             height: 1,
//                           ),
//                           CustomTextBodyAuth(textBody: "3".tr),
//                           const SizedBox(
//                             height: 15,
//                           ),
//                           CustomTextFormAuth(
//                               isNumber: false,
//                               valid: (val) {
//                                 return validInput(val!, 5, 30, "username");
//                               },
//                               myController: controller.userName,
//                               hintText: "13".tr,
//                               label: "12".tr,
//                               icon: Icons.person_outline),
//                           // CustomTextFormAuth(
//                           //     isNumber: false,
//                           //     valid: (val) {
//                           //       return validInput(val!, 5, 100, "email");
//                           //     },
//                           //     myController: controller.email,
//                           //     hintText: "4".tr,
//                           //     label: "5".tr,
//                           //     icon: Icons.email_outlined),
//                           GetBuilder<LoginCotrollerImp>(
//                             builder: ((controller) => CustomTextFormAuth(
//                                   obscureText: controller.isShoowpass,
//                                   isNumber: false,
//                                   valid: (val) {
//                                     return validInput(val!, 5, 30, "password");
//                                   },
//                                   myController: controller.password,
//                                   hintText: "7".tr,
//                                   label: "6".tr,
//                                   icon: Icons.lock_outline,
//                                   onTapIcon: () {
//                                     controller.shoowPassword();
//                                   },
//                                 )),
//                           ),
//                           InkWell(
//                             onTap: () {
//                               controller.goToForegetPassword();
//                             },
//                             child: Text(
//                               "8".tr,
//                               textAlign: TextAlign.end,
//                             ),
//                           ),
//                           CustomButtonAuth(
//                             text: "9".tr,
//                             onPressed: () {
//                               // login1();
//                               controller.login();
//                             },
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           CustomTextSignUpOrSignIn(
//                               text: "10".tr,
//                               textTow: "11".tr,
//                               onTap: () {
//                                 controller.goToSignUP();
//                               })
//                         ],
//                       ),
//                     ),
//                   )))),
//         ));
//   }
// }
