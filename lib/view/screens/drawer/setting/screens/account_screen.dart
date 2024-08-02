import 'package:e_learningplatform/controller/setting_account.dart';
import 'package:e_learningplatform/util/routes_names.dart';
import 'package:e_learningplatform/view/screens/drawer/setting/screens/edit_screen.dart';
import 'package:e_learningplatform/view/screens/drawer/setting/widgets/forward_button.dart';
import 'package:e_learningplatform/view/screens/drawer/setting/widgets/setting_item.dart';
import 'package:e_learningplatform/view/screens/drawer/setting/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../../controller/changeThemcontrorller.dart';
import '../../../../Widget/changeTheme/classListDrawer.dart';
import '../../../changeThemPage.dart';
import '../../../mycourses/myCourse1.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    SettingAccountController controller = Get.put(SettingAccountController());
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () {
      //       Get.toNamed(AppRoutes.homePage);
      //     },
      //     icon: const Icon(Ionicons.chevron_back_outline),
      //   ),
      //   leadingWidth: 80,
      // ),
      body: SingleChildScrollView(
        // child: Padding(
        //     padding: const EdgeInsets.symmetric(
        //       horizontal: 30,
        //     ),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, RoutesNames.homePage);
                  },
                  icon: const Icon(Ionicons.chevron_back_outline),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Account",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      children: [
                        Image.asset("assets/images/profile.PNG",
                            width: 70, height: 70),
                        const SizedBox(width: 20),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Uranus Code",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Youtube Channel",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        const Spacer(),
                        ForwardButton(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const EditAccountScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Language",
                    icon: Ionicons.earth,
                    bgColor: Colors.orange.shade100,
                    iconColor: Colors.orange,
                    value: "English",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Notifications",
                    icon: Ionicons.notifications,
                    bgColor: Colors.blue.shade100,
                    iconColor: Colors.blue,
                    onTap: () {
                       Navigator.push<void>(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                           MyCourse1List(),
                    ),
                  );
                    },
                  ),
                  const SizedBox(height: 20),
                  // SettingSwitch(
                  //   title: "Dark Mode",
                  //   icon: Ionicons.earth,
                  //   bgColor: Colors.purple.shade100,
                  //   iconColor: Colors.purple,
                  //   value: isDarkMode,
                  //   onTap: (value) {
                  //     setState(() {
                  //       isDarkMode = value;
                  //     });
                  //   },
                  // ),

                  GetBuilder<Changetheme>(
                    init: Changetheme(),
                    builder: (controller) => ClasslistDrawet(
                      title: "Theme",
                      icon: controller.isDark ? Icons.dark_mode : Icons.sunny,
                      onTap: () {
                        Get.to(() => ChangethemePage(),
                            transition: Transition.circularReveal,
                            duration: Duration(seconds: 1));
                      },
                    ),
                  ),

                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Contact Us",
                    icon: Ionicons.call_outline,
                    bgColor: Colors.red.shade100,
                    iconColor: Colors.red,
                    onTap: () async {
                      await launchUrl(Uri.parse("sms:+963982205675"));
                    },
                  ),
                  const SizedBox(height: 20),
                  SettingItem(
                    title: "Logout",
                    icon: Icons.exit_to_app,
                    bgColor: Colors.red.shade100,
                    iconColor: Colors.red,
                    onTap: () {
                      controller.logout();
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        // ),
      ),
    );
  }
}
