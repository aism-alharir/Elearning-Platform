import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controller/bottom_navigtion_menu/bottom_navigtion_menu_controller.dart';

class BottomNavigtionMenu extends StatelessWidget {
  const BottomNavigtionMenu({super.key});

  @override
  Widget build(BuildContext context) {
    BottomNavigationMenuController controller =
        Get.put(BottomNavigationMenuController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
            height: 80,
            elevation: 0,
            selectedIndex: controller.selectedIndex.value,
            onDestinationSelected: (index) =>
                controller.selectedIndex.value = index,
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.home_outlined), label: "Home"),
              NavigationDestination(
                  icon: Icon(Icons.play_circle_outline), label: "My Courses"),
              NavigationDestination(
                  icon: Icon(Icons.favorite_border), label: "Favorte"),
              NavigationDestination(icon: Icon(Icons.people), label: "Profile"),
            ]),
      ),
      body: Obx(
        () => controller.screens[controller.selectedIndex.value],
      ),
    );
  }
}
