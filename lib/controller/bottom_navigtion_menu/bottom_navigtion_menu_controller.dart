import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../view/screens/account/account.dart';
import '../../view/screens/home/course_home.dart';
import '../../view/screens/mycourses/myCourse1.dart';
import '../../view/screens/myfavorite/myfavorite.dart';
import '../../view/screens/profile/profile.dart';

class BottomNavigationMenuController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final List screens = [
    Container(
      color: Colors.orange,
    ),
    Container(
      color: Colors.purple,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.red,
    ),
    // const CourseHome(),
    // MyCourse1List(),
    // const MyFavorite(),
    // const AccountPage()
  ];
}
