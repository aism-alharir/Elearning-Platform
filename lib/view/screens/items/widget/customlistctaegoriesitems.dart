import 'package:e_learningplatform/controller/items_controller.dart';
import 'package:e_learningplatform/core/constant/color.dart';
import 'package:e_learningplatform/core/functions/translatedatabase.dart';
import 'package:e_learningplatform/data/model/categories_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListCategoriesItems extends GetView<ItemsControllerImp> {
  const CustomListCategoriesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
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

class Categories extends GetView<ItemsControllerImp> {
  final CategoriesModel categoriesModel;
  final int? i;
  const Categories({super.key, required this.categoriesModel, required this.i});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeCategories(i!, categoriesModel.id.toString());
      },
      child: Column(
        children: [
          GetBuilder<ItemsControllerImp>(
              builder: (controller) => Container(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    decoration: controller.selectedCategories == i
                        ? const BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 3, color: AppColor.kPrimaryColor)))
                        : null,
                    child: Text(
                      "${categoriesModel.name},",
                      style:
                          const TextStyle(color: AppColor.grey2, fontSize: 20),
                    ),
                  ))
        ],
      ),
    );
  }
}