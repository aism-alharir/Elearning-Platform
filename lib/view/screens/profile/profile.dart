import 'dart:async';
import 'package:e_learningplatform/controller/pofile_controller.dart';
import 'package:e_learningplatform/core/constant/ClassApp.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/functions/myBack/myBackHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constant/imageasset.dart';

class Profil extends StatelessWidget {
  const Profil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer? timer;

    ControllerProfile controller = Get.put(ControllerProfile());
    return Scaffold(
      // appBar: AppBar(
      //     centerTitle: true,
      //     backgroundColor: AppColor.kPrimaryColor,
      //     elevation: 0,
      //     title: Text(
      //       "Profile",
      //       style: ClassApp.appbar.headline2,
      //     )),
      body: WillPopScope(
        onWillPop: () {
          return myBackHomePage();
        },
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                "Profile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor),
              ),
            ),
            Container(
              height: 267,
              child: Stack(
                children: [
                  Positioned(
                    width: Get.width + 30,
                    height: 300,
                    left: 0,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            "${AppImageAsset.profilebackground1}",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 145,
                    child: CircleAvatar(
                      maxRadius: 50,
                      backgroundColor: const Color(0xffa53ff9).withOpacity(0.7),
                      child: Container(
                        height: Get.height,
                        width: Get.width,
                        child: ClipRRect(
                            child: Image.asset(
                              "${AppImageAsset.profile}",
                              fit: BoxFit.cover,
                            ),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(50))),
                      ),
                    ),
                  ), //                 Row(
                  Center(
                    child: Text(
                      "${controller.username}",
                      style: ClassApp.txt_style.headline1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                  child: Card(
                      margin: const EdgeInsets.fromLTRB(0.0, 45.0, 0.0, 100.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.kSecondColor.withOpacity(0.2)),
                          width: 330.0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.person_2,
                                    size: 35,
                                    color: Color.fromARGB(255, 172, 158, 14),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("username",
                                          style:
                                              ClassApp.profileditels.headline3),
                                      Text(
                                          "${(controller.username.substring(0, 9))}",
                                          style:
                                              ClassApp.profileditels.headline3),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.email,
                                    color: Colors.pinkAccent[400],
                                    size: 35,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Email",
                                          style:
                                              ClassApp.profileditels.headline3),
                                      Text("${(controller.email)}",
                                          style:
                                              ClassApp.profileditels.headline3),
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.person,
                                    color: AppColor.secondcolork,
                                    size: 35,
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("FirstName",
                                          style:
                                              ClassApp.profileditels.headline3),
                                      Text("${(controller.firstname)}",
                                          style:
                                              ClassApp.profileditels.headline3)
                                    ],
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Icon(
                              //       Icons.onetwothree_sharp,
                              //       color: Colors.black,
                              //       size: 35,
                              //     ),
                              //     SizedBox(
                              //       width: 20.0,
                              //     ),
                              //     Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Text("Age",
                              //             style:
                              //                 ClassApp.profileditels.headline3),
                              //         Text(
                              //           "${controller.r}",
                              //           style: ClassApp.profileditels.headline3,
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                            ],
                          )))),
            ),
            // Container(
            //     height: 80,
            //     width: 400,
            //     child: MaterialButton(
            //       onPressed: () {
            //         controller.Singout();
            //       },
            //       onLongPress: () => timer = Timer.periodic(
            //         const Duration(milliseconds: 1),
            //         (_) => (_) {},
            //       ),
            //       child: Text(
            //         "Logout",
            //         style: TextStyle(color: Color(0xffa53ff9)),
            //       ),
            //     )
            //     // SpringButton(
            //     //   SpringButtonType.OnlyScale,
            //     //   row(
            //     //     "Logout",
            //     //     Color(0xffa53ff9),
            //     //   ),
            //     //   onTapDown: (_) {
            //     //     controller.Singout();
            //     //   },
            //     //   onLongPress: () => timer = Timer.periodic(
            //     //     const Duration(milliseconds: 1),
            //     //     (_) => (_) {},
            //     //   ),
            //     //   onLongPressEnd: (_) {
            //     //     timer?.cancel();
            //     //   },
            //     // ),
            //     ),
          ],
        ),
      ),
    );
  }
}
