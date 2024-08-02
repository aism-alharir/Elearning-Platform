import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHeaderDrawer extends StatefulWidget {
  @override
  _MyHeaderDrawerState createState() => _MyHeaderDrawerState();
}

class _MyHeaderDrawerState extends State<MyHeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    MyServices myServices = Get.find();
    String? username = myServices.sharedPreferences.getString("username");
    String? email = myServices.sharedPreferences.getString("email");
    return Container(
      color: AppColor.kPrimaryColor,
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            height: 70,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/profile.PNG'),
              ),
            ),
          ),
          Text(
            "$username",
            // ignore: prefer_const_constructors
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          Text(
            "$email",
            style: TextStyle(
              color: Colors.grey[200],
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
