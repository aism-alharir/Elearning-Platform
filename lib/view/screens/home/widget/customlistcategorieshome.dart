import 'package:e_learningplatform/controller/home/course_home_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCategoriesHome extends GetView<CourseHomeController> {
  const CustomListCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Categories(
              i: index,
              categoriesModel:
                  CategoriesModel.fromJson(controller.categories[index])),
          separatorBuilder: (context, index) => const SizedBox(
                width: 17,
              ),
          itemCount: controller.categories.length),
    );
  }
}

class Categories extends GetView<CourseHomeController> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.goToItems(
            controller.categories, i!, categoriesModel.id.toString());
      },
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 100,
            width: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: Image.network(
              height: 90,
              width: 110,
              fit: BoxFit.fill,
              "${categoriesModel.image}",
              // color: AppColor.primaryColor,
            ),
          ),
          Text(
            "${categoriesModel.name},",
            style: const TextStyle(color: AppColor.black, fontSize: 16),
          )
        ],
      ),
    );
  }
}
